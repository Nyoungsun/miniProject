package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//마이페이지 
@Controller
public class MemberController {
	
	@RequestMapping(value = "myPage", method = RequestMethod.GET)
	public String myPage() {
		return "myPage";
	}
	
}
