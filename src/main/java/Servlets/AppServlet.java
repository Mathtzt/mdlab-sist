package Servlets;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URL;

@WebServlet(name = "AppServlet",  urlPatterns = {"/list"})
public class AppServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONArray json = retrieveData();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

    }

    private JSONArray retrieveData() {
        JSONParser jsonParser = new JSONParser();
        JSONArray jsonArray = new JSONArray();
        URL path = getClass().getResource("/data.json");
        try {
            FileReader fileReader = new FileReader(path.getPath());
            Object obj = jsonParser.parse(fileReader);
            jsonArray = (JSONArray) obj;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return jsonArray;
    }
}