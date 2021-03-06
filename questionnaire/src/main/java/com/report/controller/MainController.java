package com.report.controller;

import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.report.dto.QuestionInfoDTO;
import com.report.dto.QuestionMstDTO;
import com.report.dto.UntMstInfoDTO;
import com.report.dto.UserInfoDTO;
import com.report.service.MainService;
import com.report.service.SurveyService;


@Controller
public class MainController {
	
	@Inject
	MainService mainService;
	@Inject
	SurveyService SurveyService;
	
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
		if(session.getAttribute("userID") == null) {
			path="redirect:/";
		}else {
			String userID = (String)session.getAttribute("userID");
			String userNM = (String)session.getAttribute("userNM");
			Map<String,Object> chartDateMap=mainService.chartDate();
			int qmCount = 0;
			QuestionMstDTO qmDto = new QuestionMstDTO();
			String[] arrDate = (String[]) chartDateMap.get("arrDate");
			int[] arrCount=new int[arrDate.length];
			
			if(userID.equals("sunsoft")) {
				qmDto.setUSERID(userID);
			}else {
				qmDto.setUNTCD(session.getAttribute("untcd").toString());
			}
			
			for (int i = 0; i < arrDate.length; i++) {
				qmDto.setQUEDATE(arrDate[i]);
				qmCount=SurveyService.qmCount(qmDto);
				arrCount[i]=qmCount;
			}
			
			model.addAttribute("arrCount",arrCount);
			model.addAttribute("date",chartDateMap.get("arrDate"));
			model.addAttribute("userID", userID);
			model.addAttribute("userNM", userNM);
			path = "Main";
		}
		
		return path;
	}
	
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String addUserGet(UserInfoDTO uiDto,Model model,HttpSession session) {
		String path="";
		if(session.getAttribute("userID") == null) {
			path="redirect:/";
		}else {
		List<UserInfoDTO> userList;
		
		uiDto.setUNTCD(session.getAttribute("untcd").toString());
		uiDto.setUSERID(session.getAttribute("userID").toString());
		userList=mainService.userList(uiDto);
		
		List<UserInfoDTO> dptList = mainService.dptList(uiDto);
		
		model.addAttribute("userList",userList);
		model.addAttribute("dptList",dptList);
		path="addUser";
		}
		return path;
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
		String sessionID = session.getAttribute("userID").toString();
		if (!sessionID.equals("sunsoft")) {
			uiDto.setUNTCD(session.getAttribute("untcd").toString().trim());
		}
		uiDto.setREGUSER(session.getAttribute("userNM").toString().trim());
		String hp1 = uiDto.getHPNO1();
		String hp2 = uiDto.getHPNO2();
		String hp3 = uiDto.getHPNO3();
		uiDto.setHPNO(hp1+"-"+hp2+"-"+hp3);
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
		String path="";
		if(session.getAttribute("userID") == null) {
			path="redirect:/";
		}else {
		List<UntMstInfoDTO> corpList;
		umiDto.setUNTCD(session.getAttribute("untcd").toString());
		umiDto.setUSERID(session.getAttribute("userID").toString());
		corpList = mainService.mstList(umiDto);
		model.addAttribute("corpList",corpList);
		path="corpManage";
		}
		
		return path;
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
		String tel1 = umiDto.getTELNO1();
		String tel2 = umiDto.getTELNO2();
		String tel3 = umiDto.getTELNO3();
		String fax1 = umiDto.getFAXNO1();
		String fax2 = umiDto.getFAXNO2();
		String fax3 = umiDto.getFAXNO3();
		umiDto.setTELNO(tel1+"-"+tel2+"-"+tel3);
		umiDto.setFAXNO(fax1+"-"+fax2+"-"+fax3);
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
		String path="";
		if(session.getAttribute("userID") == null) {
			path="redirect:/";
		}else {
			String sessionID = session.getAttribute("userID").toString();
			if (sessionID.equals("sunsoft")) {
				qiDto.setUSERID(sessionID);
			}else {
				qiDto.setUNTCD(session.getAttribute("untcd").toString());
			}
			List<QuestionInfoDTO> questionList = mainService.questinoList(qiDto);
			
			model.addAttribute("questionList",questionList);
			path ="survey/addQuestion";
		}
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
	
	
	@RequestMapping(value="/QRCodePrintForm")
	public String QRCodePrintForm() {
		String path="";
		
		path="QRCodePrintForm";
		return path;
	}
}
