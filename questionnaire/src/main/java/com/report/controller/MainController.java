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

import com.report.dto.QuestionInfoDTO;
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
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model,HttpSession session) {
		session.invalidate();
		return "redirect:/";
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
	public String addUserGet(UserInfoDTO uiDto,Model model,HttpSession session) {
		List<UserInfoDTO> userList;
		uiDto.setUNTCD(session.getAttribute("untcd").toString());
		userList=mainService.userList(uiDto);
		
		List<UserInfoDTO> dptList = mainService.dptList(uiDto);
		
		model.addAttribute("userList",userList);
		model.addAttribute("dptList",dptList);
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
		uiDto.setREGUSER(session.getAttribute("userNM").toString().trim());
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
	public String corpManage(Model model,UntMstInfoDTO umiDto,HttpSession session){
		List<UntMstInfoDTO> corpList;
		umiDto.setUNTCD(session.getAttribute("untcd").toString());
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
	@RequestMapping(value="/insertCst", method=RequestMethod.POST)
	public String insertCst(UntMstInfoDTO umiDto,HttpServletResponse response,HttpSession session){
		umiDto.setREGUSER(session.getAttribute("userNM").toString().trim());
		
		mainService.insertCst(umiDto);
		
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
		return "corpManageForm";
	}
	
	
	
	@RequestMapping(value="/survey/addQuestion")
	public String addQuestion(Model model,QuestionInfoDTO qiDto, HttpSession session) {
		String path ="";
		qiDto.setUNTCD(session.getAttribute("untcd").toString());
		List<QuestionInfoDTO> questionList = mainService.questinoList(qiDto);
		
		model.addAttribute("questionList",questionList);
		path ="survey/addQuestion";
		return path;
	}
	@RequestMapping(value="/survey/questionForm")
	public String questionForm(Model model,QuestionInfoDTO qiDto) {
		String path ="";
		QuestionInfoDTO questionOne = mainService.questionOne(qiDto);
		model.addAttribute("questionOne",questionOne);
		path ="survey/questionForm";
		return path;
	}
	@RequestMapping(value="/survey/insertQuestion", method=RequestMethod.POST)
	public String insertQuestion(QuestionInfoDTO qiDto,HttpServletResponse response,HttpSession session){
		qiDto.setREGUSER(session.getAttribute("userNM").toString().trim());
		qiDto.setUNTCD(session.getAttribute("untcd").toString().trim());
		mainService.insertQuestion(qiDto);
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
		return "survey/questionForm";
	}

}
