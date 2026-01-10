<%
    // Hapus sesi (lupakan siapa yang login)
    session.invalidate();
    
    // Tendang balik ke halaman login
    response.sendRedirect("login.jsp");
%>