package com.kitri.util;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MoveUrl {
	public static void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
			response.sendRedirect(request.getContextPath() + path); //얘는 로케이션이고 (어디든 가능)
	}
	public static void forward(HttpServletRequest request, HttpServletResponse response, String path) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path); //얘는 path 경로 (웹에서의 path는 프로젝트 안에서만 가능)
		dispatcher.forward(request, response);
	}
}