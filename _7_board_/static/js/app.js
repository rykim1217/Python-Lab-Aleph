// ==========================================
// Aleph Board - Frontend JavaScript Logic
// RESTful API + JWT + Cursor Pagination
// ==========================================

const API_BASE = '/api';

// State
const state = {
  token: localStorage.getItem('access_token') || null,
  currentUser: null,
  categories: [],
  selectedCategoryId: null,
  searchKeyword: '',
  searchType: 'all',
  posts: [],
  nextCursor: null,
  hasMore: false,
  isLoading: false,
  activePost: null
};

// ================= API HELPER =================
async function apiFetch(url, options = {}) {
  const headers = {
    'Content-Type': 'application/json',
    ...(options.headers || {})
  };

  if (state.token) {
    headers['Authorization'] = `Bearer ${state.token}`;
  }

  const response = await fetch(url, { ...options, headers });
  const data = await response.json().catch(() => ({}));

  if (!response.ok) {
    if (response.status === 401 && state.token) {
      // Token expired or invalid
      logout();
      showToast('로그인 세션이 만료되었습니다. 다시 로그인해주세요.', 'error');
    }
    const errorMsg = data.error || data.message || '요청 처리 중 오류가 발생했습니다.';
    throw new Error(errorMsg);
  }

  return data;
}

// ================= TOAST UTILITY =================
function showToast(message, type = 'success') {
  const container = document.getElementById('toast-container');
  const toast = document.createElement('div');
  
  const bgClass = type === 'success' ? 'bg-slate-900 text-white' : 'bg-rose-600 text-white';
  const icon = type === 'success' ? '<i class="fa-solid fa-circle-check text-emerald-400"></i>' : '<i class="fa-solid fa-circle-exclamation text-yellow-300"></i>';

  toast.className = `${bgClass} pointer-events-auto px-4 py-3 rounded-2xl shadow-xl flex items-center space-x-3 text-sm transition-all duration-300 transform translate-y-4 opacity-0`;
  toast.innerHTML = `
    ${icon}
    <span class="font-medium">${message}</span>
  `;

  container.appendChild(toast);

  // Trigger animation
  requestAnimationFrame(() => {
    toast.classList.remove('translate-y-4', 'opacity-0');
  });

  setTimeout(() => {
    toast.classList.add('opacity-0', 'translate-y-2');
    setTimeout(() => toast.remove(), 300);
  }, 3500);
}

// ================= AUTH MANAGEMENT =================
async function checkAuth() {
  if (!state.token) {
    state.currentUser = null;
    renderNavbarAuth();
    return;
  }

  try {
    const data = await apiFetch(`${API_BASE}/auth/me`);
    state.currentUser = data.user;
  } catch (err) {
    state.token = null;
    state.currentUser = null;
    localStorage.removeItem('access_token');
  }
  renderNavbarAuth();
}

function renderNavbarAuth() {
  const container = document.getElementById('nav-auth-section');

  if (state.currentUser) {
    container.innerHTML = `
      <button onclick="openPostModal()" class="px-4 py-2 bg-indigo-600 hover:bg-indigo-700 text-white text-xs sm:text-sm font-bold rounded-xl shadow-md shadow-indigo-200 transition flex items-center gap-1.5">
        <i class="fa-solid fa-plus"></i>
        <span>새 글 작성</span>
      </button>
      <div class="flex items-center space-x-2 pl-2 border-l border-slate-200">
        <div class="w-8 h-8 rounded-full bg-slate-800 text-white flex items-center justify-center font-bold text-xs">
          ${state.currentUser.username.charAt(0).toUpperCase()}
        </div>
        <span class="hidden sm:inline text-xs font-bold text-slate-700">${state.currentUser.username}</span>
        <button onclick="logout()" title="로그아웃" class="text-slate-400 hover:text-rose-500 p-1.5 rounded-lg transition">
          <i class="fa-solid fa-arrow-right-from-bracket"></i>
        </button>
      </div>
    `;
  } else {
    container.innerHTML = `
      <button onclick="openAuthModal('login')" class="px-4 py-2 text-slate-700 hover:text-indigo-600 text-xs sm:text-sm font-semibold rounded-xl transition">
        로그인
      </button>
      <button onclick="openAuthModal('signup')" class="px-4 py-2 bg-indigo-600 hover:bg-indigo-700 text-white text-xs sm:text-sm font-bold rounded-xl shadow-md shadow-indigo-100 transition">
        회원가입
      </button>
    `;
  }
}

function logout() {
  state.token = null;
  state.currentUser = null;
  localStorage.removeItem('access_token');
  renderNavbarAuth();
  showToast('로그아웃 되었습니다.');
}

// ================= CATEGORIES =================
async function loadCategories() {
  try {
    const data = await apiFetch(`${API_BASE}/categories`);
    state.categories = data.categories || [];
    renderCategoryPills();
    renderCategoryDropdown();
  } catch (err) {
    console.error('Failed to load categories:', err);
  }
}

function renderCategoryPills() {
  const container = document.getElementById('category-pills-container');
  let html = `
    <button data-cat-id="" class="cat-pill ${state.selectedCategoryId === null ? 'bg-indigo-600 text-white shadow-sm font-bold' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'} px-4 py-1.5 rounded-full text-xs sm:text-sm transition whitespace-nowrap">
      전체
    </button>
  `;

  state.categories.forEach(cat => {
    const isActive = state.selectedCategoryId === cat.id;
    html += `
      <button data-cat-id="${cat.id}" class="cat-pill ${isActive ? 'bg-indigo-600 text-white shadow-sm font-bold' : 'bg-slate-100 text-slate-600 hover:bg-slate-200'} px-4 py-1.5 rounded-full text-xs sm:text-sm transition whitespace-nowrap">
        ${cat.name}
      </button>
    `;
  });

  container.innerHTML = html;

  // Add click events
  container.querySelectorAll('.cat-pill').forEach(btn => {
    btn.addEventListener('click', () => {
      const catId = btn.getAttribute('data-cat-id');
      state.selectedCategoryId = catId ? parseInt(catId) : null;
      renderCategoryPills();
      updateFilterBadge();
      loadPosts(true);
    });
  });
}

function renderCategoryDropdown() {
  const select = document.getElementById('post-category-select');
  select.innerHTML = state.categories.map(c => `<option value="${c.id}">${c.name}</option>`).join('');
}

// ================= POSTS & CURSOR PAGINATION =================
async function loadPosts(reset = true) {
  if (state.isLoading) return;
  state.isLoading = true;

  const spinner = document.getElementById('loading-spinner');
  const loadMoreBtn = document.getElementById('load-more-btn');
  const endOfPosts = document.getElementById('end-of-posts');

  spinner.classList.remove('hidden');
  loadMoreBtn.classList.add('hidden');
  endOfPosts.classList.add('hidden');

  if (reset) {
    state.posts = [];
    state.nextCursor = null;
    state.hasMore = false;
  }

  // Build Query params
  const params = new URLSearchParams();
  params.append('limit', '8');
  if (state.nextCursor && !reset) {
    params.append('cursor', state.nextCursor);
  }
  if (state.selectedCategoryId) {
    params.append('category_id', state.selectedCategoryId);
  }
  if (state.searchKeyword) {
    params.append('search', state.searchKeyword);
    params.append('search_type', state.searchType);
  }

  try {
    const data = await apiFetch(`${API_BASE}/posts?${params.toString()}`);
    
    if (reset) {
      state.posts = data.posts || [];
    } else {
      state.posts = [...state.posts, ...(data.posts || [])];
    }

    state.nextCursor = data.next_cursor;
    state.hasMore = data.has_more;

    renderPostList();
  } catch (err) {
    showToast(err.message, 'error');
  } finally {
    state.isLoading = false;
    spinner.classList.add('hidden');

    if (state.hasMore) {
      loadMoreBtn.classList.remove('hidden');
      endOfPosts.classList.add('hidden');
    } else {
      loadMoreBtn.classList.add('hidden');
      if (state.posts.length > 0) {
        endOfPosts.classList.remove('hidden');
      }
    }
  }
}

function renderPostList() {
  const container = document.getElementById('post-list-container');

  if (state.posts.length === 0) {
    container.innerHTML = `
      <div class="bg-white rounded-2xl border border-slate-200 p-12 text-center space-y-3">
        <div class="w-16 h-16 bg-slate-100 text-slate-400 rounded-full flex items-center justify-center mx-auto text-2xl">
          <i class="fa-solid fa-newspaper"></i>
        </div>
        <h3 class="text-base font-bold text-slate-700">게시글이 없습니다</h3>
        <p class="text-xs text-slate-400">새로운 게시글을 가장 먼저 작성해보세요!</p>
      </div>
    `;
    return;
  }

  container.innerHTML = state.posts.map(post => {
    const categoryName = post.category ? post.category.name : '일반';
    const authorName = post.author ? post.author.username : '익명';
    const initial = authorName.charAt(0).toUpperCase();

    return `
      <div onclick="viewPostDetail(${post.id})" class="group bg-white hover:bg-slate-50/80 rounded-2xl p-5 border border-slate-200 hover:border-indigo-300 hover:shadow-md transition duration-200 cursor-pointer">
        <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-2 mb-2">
          <div class="flex items-center space-x-2">
            <span class="px-2.5 py-0.5 rounded-full text-xs font-semibold bg-indigo-50 text-indigo-600 border border-indigo-100">
              ${categoryName}
            </span>
            <span class="text-xs text-slate-400 font-mono">#${post.id}</span>
          </div>
          <div class="flex items-center space-x-3 text-xs text-slate-400">
            <span><i class="fa-regular fa-clock mr-1"></i>${post.created_at}</span>
            <span><i class="fa-regular fa-eye mr-1"></i>${post.view_count}</span>
          </div>
        </div>

        <h3 class="text-base sm:text-lg font-bold text-slate-900 group-hover:text-indigo-600 transition mb-1.5 line-clamp-1">
          ${escapeHtml(post.title)}
        </h3>

        <p class="text-xs sm:text-sm text-slate-500 line-clamp-2 leading-relaxed mb-3">
          ${escapeHtml(post.preview || '')}
        </p>

        <div class="flex items-center space-x-2 pt-2 border-t border-slate-100">
          <div class="w-6 h-6 rounded-full bg-slate-700 text-white flex items-center justify-center font-bold text-[10px]">
            ${initial}
          </div>
          <span class="text-xs font-medium text-slate-600">${authorName}</span>
        </div>
      </div>
    `;
  }).join('');
}

function updateFilterBadge() {
  const badge = document.getElementById('filter-status-badge');
  const text = document.getElementById('filter-status-text');

  const hasFilter = state.selectedCategoryId !== null || state.searchKeyword !== '';
  if (!hasFilter) {
    badge.classList.add('hidden');
    return;
  }

  badge.classList.remove('hidden');
  const parts = [];
  if (state.selectedCategoryId) {
    const cat = state.categories.find(c => c.id === state.selectedCategoryId);
    if (cat) parts.push(`카테고리: ${cat.name}`);
  }
  if (state.searchKeyword) {
    const typeLabel = {
      all: '통합',
      title: '제목',
      content: '내용',
      author: '작성자'
    }[state.searchType] || '';
    parts.push(`검색어 [${typeLabel}]: "${state.searchKeyword}"`);
  }
  text.innerHTML = `<i class="fa-solid fa-filter"></i> ${parts.join(' | ')}`;
}

// ================= MODAL HANDLERS =================
function openAuthModal(tab = 'login') {
  const modal = document.getElementById('auth-modal');
  modal.classList.remove('hidden');
  switchAuthTab(tab);
}

function closeAuthModal() {
  document.getElementById('auth-modal').classList.add('hidden');
}

function switchAuthTab(tab) {
  const tabLogin = document.getElementById('tab-login');
  const tabSignup = document.getElementById('tab-signup');
  const formLogin = document.getElementById('form-login');
  const formSignup = document.getElementById('form-signup');

  if (tab === 'login') {
    tabLogin.className = 'pb-3 font-bold text-sm text-indigo-600 border-b-2 border-indigo-600 transition';
    tabSignup.className = 'pb-3 font-medium text-sm text-slate-500 hover:text-slate-800 transition';
    formLogin.classList.remove('hidden');
    formSignup.classList.add('hidden');
  } else {
    tabSignup.className = 'pb-3 font-bold text-sm text-indigo-600 border-b-2 border-indigo-600 transition';
    tabLogin.className = 'pb-3 font-medium text-sm text-slate-500 hover:text-slate-800 transition';
    formSignup.classList.remove('hidden');
    formLogin.classList.add('hidden');
  }
}

function openPostModal(post = null) {
  if (!state.currentUser) {
    showToast('로그인이 필요한 기능입니다.', 'error');
    openAuthModal('login');
    return;
  }

  const modal = document.getElementById('post-modal');
  const modalTitle = document.getElementById('post-modal-title');
  const idInput = document.getElementById('post-id-input');
  const titleInput = document.getElementById('post-title-input');
  const contentInput = document.getElementById('post-content-input');
  const catSelect = document.getElementById('post-category-select');
  const errorMsg = document.getElementById('post-error-msg');

  errorMsg.classList.add('hidden');

  if (post) {
    modalTitle.textContent = '게시글 수정';
    idInput.value = post.id;
    titleInput.value = post.title;
    contentInput.value = post.content;
    if (post.category) catSelect.value = post.category.id;
  } else {
    modalTitle.textContent = '새 게시글 작성';
    idInput.value = '';
    titleInput.value = '';
    contentInput.value = '';
    if (state.selectedCategoryId) catSelect.value = state.selectedCategoryId;
  }

  modal.classList.remove('hidden');
}

function closePostModal() {
  document.getElementById('post-modal').classList.add('hidden');
}

async function viewPostDetail(postId) {
  try {
    const data = await apiFetch(`${API_BASE}/posts/${postId}`);
    const post = data.post;
    state.activePost = post;

    document.getElementById('detail-id').textContent = post.id;
    document.getElementById('detail-category-badge').textContent = post.category ? post.category.name : '일반';
    document.getElementById('detail-title').textContent = post.title;
    document.getElementById('detail-author').textContent = post.author ? post.author.username : '익명';
    document.getElementById('detail-date').textContent = post.created_at;
    document.getElementById('detail-views').textContent = post.view_count;
    document.getElementById('detail-content').textContent = post.content;

    // Check author permissions for edit/delete
    const ownerActions = document.getElementById('detail-owner-actions');
    if (state.currentUser && post.author && state.currentUser.id === post.author.id) {
      ownerActions.classList.remove('hidden');
    } else {
      ownerActions.classList.add('hidden');
    }

    document.getElementById('detail-modal').classList.remove('hidden');
  } catch (err) {
    showToast(err.message, 'error');
  }
}

function closeDetailModal() {
  document.getElementById('detail-modal').classList.add('hidden');
}

// ================= EVENT LISTENERS =================
document.addEventListener('DOMContentLoaded', () => {
  // Init
  checkAuth();
  loadCategories();
  loadPosts(true);

  // Tab switching
  document.getElementById('tab-login').addEventListener('click', () => switchAuthTab('login'));
  document.getElementById('tab-signup').addEventListener('click', () => switchAuthTab('signup'));

  // Load more button
  document.getElementById('load-more-btn').addEventListener('click', () => {
    loadPosts(false);
  });

  // Search form
  const searchForm = document.getElementById('search-form');
  const searchInput = document.getElementById('search-input');
  const searchTypeSelect = document.getElementById('search-type');
  const clearSearchBtn = document.getElementById('clear-search-btn');

  searchInput.addEventListener('input', () => {
    if (searchInput.value.trim()) {
      clearSearchBtn.classList.remove('hidden');
    } else {
      clearSearchBtn.classList.add('hidden');
    }
  });

  clearSearchBtn.addEventListener('click', () => {
    searchInput.value = '';
    clearSearchBtn.classList.add('hidden');
    state.searchKeyword = '';
    updateFilterBadge();
    loadPosts(true);
  });

  searchForm.addEventListener('submit', (e) => {
    e.preventDefault();
    state.searchKeyword = searchInput.value.trim();
    state.searchType = searchTypeSelect.value;
    updateFilterBadge();
    loadPosts(true);
  });

  document.getElementById('refresh-btn').addEventListener('click', () => {
    loadPosts(true);
  });

  document.getElementById('reset-filter-btn').addEventListener('click', () => {
    state.selectedCategoryId = null;
    state.searchKeyword = '';
    searchInput.value = '';
    clearSearchBtn.classList.add('hidden');
    renderCategoryPills();
    updateFilterBadge();
    loadPosts(true);
  });

  // Login Form submit
  document.getElementById('form-login').addEventListener('submit', async (e) => {
    e.preventDefault();
    const username = document.getElementById('login-username').value.trim();
    const password = document.getElementById('login-password').value.trim();
    const errorEl = document.getElementById('login-error-msg');

    try {
      const res = await apiFetch(`${API_BASE}/auth/login`, {
        method: 'POST',
        body: JSON.stringify({ username, password })
      });

      state.token = res.access_token;
      state.currentUser = res.user;
      localStorage.setItem('access_token', res.access_token);
      
      closeAuthModal();
      renderNavbarAuth();
      showToast('로그인되었습니다!');
    } catch (err) {
      errorEl.textContent = err.message;
      errorEl.classList.remove('hidden');
    }
  });

  // Signup Form submit
  document.getElementById('form-signup').addEventListener('submit', async (e) => {
    e.preventDefault();
    const username = document.getElementById('signup-username').value.trim();
    const email = document.getElementById('signup-email').value.trim();
    const password = document.getElementById('signup-password').value.trim();
    const errorEl = document.getElementById('signup-error-msg');

    try {
      const res = await apiFetch(`${API_BASE}/auth/signup`, {
        method: 'POST',
        body: JSON.stringify({ username, email, password })
      });

      state.token = res.access_token;
      state.currentUser = res.user;
      localStorage.setItem('access_token', res.access_token);

      closeAuthModal();
      renderNavbarAuth();
      showToast('회원가입 및 로그인이 완료되었습니다!');
    } catch (err) {
      errorEl.textContent = err.message;
      errorEl.classList.remove('hidden');
    }
  });

  // Create or Update Post Form submit
  document.getElementById('post-form').addEventListener('submit', async (e) => {
    e.preventDefault();
    const postId = document.getElementById('post-id-input').value;
    const category_id = parseInt(document.getElementById('post-category-select').value);
    const title = document.getElementById('post-title-input').value.trim();
    const content = document.getElementById('post-content-input').value.trim();
    const errorEl = document.getElementById('post-error-msg');

    const isEdit = Boolean(postId);
    const url = isEdit ? `${API_BASE}/posts/${postId}` : `${API_BASE}/posts`;
    const method = isEdit ? 'PUT' : 'POST';

    try {
      await apiFetch(url, {
        method,
        body: JSON.stringify({ title, content, category_id })
      });

      closePostModal();
      showToast(isEdit ? '게시글이 수정되었습니다.' : '새 게시글이 등록되었습니다.');
      loadPosts(true);

      if (isEdit && state.activePost && state.activePost.id === parseInt(postId)) {
        viewPostDetail(postId);
      }
    } catch (err) {
      errorEl.textContent = err.message;
      errorEl.classList.remove('hidden');
    }
  });

  // Edit Button in Detail View
  document.getElementById('btn-edit-post').addEventListener('click', () => {
    if (state.activePost) {
      closeDetailModal();
      openPostModal(state.activePost);
    }
  });

  // Delete Button in Detail View
  document.getElementById('btn-delete-post').addEventListener('click', async () => {
    if (!state.activePost) return;
    if (!confirm('정말로 이 게시글을 삭제하시겠습니까?')) return;

    try {
      await apiFetch(`${API_BASE}/posts/${state.activePost.id}`, {
        method: 'DELETE'
      });

      closeDetailModal();
      showToast('게시글이 삭제되었습니다.');
      loadPosts(true);
    } catch (err) {
      showToast(err.message, 'error');
    }
  });
});

// Helper for HTML escaping
function escapeHtml(str) {
  if (!str) return '';
  return str.replace(/[&<>"']/g, m => ({
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;'
  })[m]);
}
