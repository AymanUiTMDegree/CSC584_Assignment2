/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ProfileController;

import java.sql.SQLException;
import Profile.Profile;
import ProfileDAO.ProfileDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author maima
 */
@WebServlet(name = "ProfileController", urlPatterns = {"/ProfileController"})
public class ProfileController extends HttpServlet {
    
    private ProfileDAO profileDAO;
    
    @Override
    public void init() {
        profileDAO = new ProfileDAO();
    }
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void doPost(HttpServletRequest request, 
            HttpServletResponse response) 
            throws ServletException, IOException { 

        String fullname = request.getParameter("fullname"); 
        String studentid = request.getParameter("studentid"); 
        String email = request.getParameter("email"); 
        String program = request.getParameter("program");
        String hobbies = request.getParameter("hobbies");
        String bio = request.getParameter("bio");
        String picture = "default.jpg";

        boolean valid = true; 

        if(fullname == null || fullname.isEmpty()) { 
            valid = false; 
        } 
        if(studentid == null || !studentid.matches("\\d+")) { 
            valid = false; 
        } 
        if(email== null || !email.contains("@")) { 
            valid = false; 
        } 
        if(program == null || program.isEmpty()) { 
            valid = false; 
        } 

        if (valid) { 
            try {
                int studentidINT = Integer.parseInt(studentid);

                Profile newProfile = new Profile(studentidINT, fullname, email, program, hobbies, bio, picture);

                profileDAO.insertProfile(newProfile);

                request.setAttribute("name", fullname); 
                request.setAttribute("id", studentid); 
                request.setAttribute("email", email);
                request.setAttribute("program", program);
                request.setAttribute("hobbies", hobbies);
                request.setAttribute("bio", bio); 
                
                request.getRequestDispatcher("profile.jsp").forward(request, response); 

            } catch (NumberFormatException | SQLException e) {
                e.printStackTrace();
                request.getRequestDispatcher("error.jsp").forward(request, response); 
            }
        } else { 
            request.getRequestDispatcher("error.jsp").forward(request, response); 
        }
        
        /**
            ASSIGNMENT 1 ORIGINAL
            if(valid) { 
            request.setAttribute("name", fullname); 
            request.setAttribute("id", studentid); 
            request.setAttribute("email", email);
            request.setAttribute("program", program);
            request.setAttribute("hobbies", hobbies);
            request.setAttribute("bio", bio); 
            
            request.getRequestDispatcher("display.jsp").forward(request, response); 
        } else { 
            request.getRequestDispatcher("error.jsp").forward(request, response); 
        } **/
    } 

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProfileController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Controller Servlet for handling profile interactions.";
    }// </editor-fold>

}
