App mở
 ↓
AuthProvider.checkLoginStatus()
 ↓
Có token? ── yes ─▶ Home
      │
      no
      ↓
Login
 ↓
Gọi API login
 ↓
Lưu token
 ↓
auth.login()
 ↓
Home
 ↓
Logout
 ↓
Xoá token
 ↓
Login
