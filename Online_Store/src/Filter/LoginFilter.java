// package Filter;
//
// import java.io.IOException;
//
// import javax.servlet.Filter;
// import javax.servlet.FilterChain;
// import javax.servlet.FilterConfig;
// import javax.servlet.ServletException;
// import javax.servlet.ServletRequest;
// import javax.servlet.ServletResponse;
// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;
//
//// @WebFilter("/Login.jsp")
//
// public class LoginFilter implements Filter {
//
// @Override
// public void init(FilterConfig filterConfig) throws ServletException {
// // Initialization code, if any
// }
//
// @Override
// public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
// throws IOException, ServletException {
// HttpServletRequest httpRequest = (HttpServletRequest) request;
// HttpServletResponse httpResponse = (HttpServletResponse) response;
//
// if (isLoggedIn(httpRequest)) {
// chain.doFilter(request, response);
//
// System.out.println("Hi Filter");
// } else {
// httpResponse.sendRedirect("Login.jsp");
// }
// }
//
// private boolean isLoggedIn(HttpServletRequest request) {
// String username = (String) request.getSession().getAttribute("username");
// String password = (String) request.getSession().getAttribute("password");
// return username != null && password != null;
// }
//
// @Override
// public void destroy() {
// // Cleanup code, if any
// }
// }
