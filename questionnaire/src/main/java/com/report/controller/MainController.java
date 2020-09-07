package com.report.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.report.dto.UntMstInfoDTO;
import com.report.dto.UserInfoDTO;
import com.report.service.MainService;


@Controller
public class MainController {
	
	@Inject
	MainService mainService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Model model,UserInfoDTO uiDto) {
		
		return "login";
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public String loginCheck(Model model,UserInfoDTO uiDto,HttpSession session,HttpServletResponse response){
		String path="";
		boolean result = false;
		result = mainService.loginCheck(uiDto,session);
		if (result) {
			path = "redirect:/Main";
		}else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('아이디, 패스워드를 확인하세요.')");
				out.println("</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			path = "login";
		}
		
		return path;
	}
	
	@RequestMapping(value="/Main")
	public String Main(HttpSession session, Model model) {
		String path="";
		String userID = (String)session.getAttribute("userID");
		String userNM = (String)session.getAttribute("userNM");
		model.addAttribute("userID", userID);
		model.addAttribute("userNM", userNM);
		path = "Main";
		return path;
	}
	
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String addUserGet(UserInfoDTO uiDto,Model model) {
		List<UserInfoDTO> userList;
		userList=mainService.userList(uiDto);
		model.addAttribute("userList",userList);
		
		return "addUser";
	}
	
	@RequestMapping(value = "/userForm", method = RequestMethod.GET)
	public String userForm(Model model,UserInfoDTO uiDto) {
		if (uiDto.getUSERID() != "") {
			UserInfoDTO userOne = mainService.userOne(uiDto);
			model.addAttribute("userOne",userOne);
		}
		return "userForm";
	}
	
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	public String addUserPost(UserInfoDTO uiDto,Model model, HttpServletResponse response,HttpSession session) {
		uiDto.setUNTCD(session.getAttribute("untcd").toString().trim());
		String result = mainService.insertUser(uiDto);
		
		try {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("window.opener.location.reload();");
			out.println("window.close();");
			out.println("</script>");
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "userForm";
	}
	
	@RequestMapping(value="/corpManage", method=RequestMethod.GET)
	public String corpManage(Model model,UntMstInfoDTO umiDto){
		List<UntMstInfoDTO> corpList;
		corpList = mainService.mstList(umiDto);
		model.addAttribute("corpList",corpList);
		
		return "corpManage";
	}
	
	@RequestMapping(value="/corpManageForm", method=RequestMethod.GET)
	public String corpManageForm(Model model,UntMstInfoDTO umiDto){
		if (umiDto.getUNTCD() != "") {
			UntMstInfoDTO mstOne = mainService.mstOne(umiDto);
			model.addAttribute("mstOne",mstOne);
		}
		return "corpManageForm";
	}
//	
	@RequestMapping(value="/insertCst", method=RequestMethod.POST)
	public String insertCst(UntMstInfoDTO umiDto,HttpServletResponse response){
//		mainService.insertCst(umiDto);
//		
//		try {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("window.opener.location.reload();");
//			out.println("window.close();");
//			out.println("</script>");
//			out.flush();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		return "corpManageForm";
	}

}
