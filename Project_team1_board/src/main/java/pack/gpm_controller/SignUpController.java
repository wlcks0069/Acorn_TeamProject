package pack.gpm_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pack.gpm_model.GPMemberInter;



@Controller
public class SignUpController {
	@Autowired
	private GPMemberInter gpmInter;	
	
	@RequestMapping(value="gpsignup", method=RequestMethod.GET)
	public String signup(){
		return "gpm_signup";
	}	
	
	@RequestMapping(value="gpsignup", method=RequestMethod.POST)
	public String writeSubmit(GPMemberBean bean){
		System.out.println("SignUpController: writeSubmit 호출 완료");
		bean.setGpmDate();
		System.out.println("SignUpController: bean을 통한 메소드 setGpmDate 호출 완료");
		System.out.println("SignUpController: 이름: "+bean.getGpmName());
		System.out.println("SignUpController: 성별: "+bean.getGpmGender());
		System.out.println("SignUpController: 나이: "+bean.getGpmAge());
		System.out.println("SignUpController: 이메일: "+bean.getGpmEmail());
		System.out.println("SignUpController: 닉네임: "+bean.getGpmNick());
		System.out.println("SignUpController: 비밀번호: "+bean.getGpmPwd());
		System.out.println("SignUpController: 입력일시: "+bean.getGpmDate());
		System.out.println("SignUpController: setter를 통해 미리 저장된 인수들 확인 완료");


		//새 글번호는 현재 레코드에서 가장 큰번호를 구해 +1
		int newNum=gpmInter.currentMaxnum()+1;
		System.out.println("SignUpController: 갱신된 글번호 획득 완료 "+newNum);

		bean.setGpmNumber(newNum+"");
		System.out.println("SignUpController: 글번호 입력 완료");
		System.out.println("SignUpController: 입력된 글번호 확인 "+bean.getGpmNumber());

		boolean result=gpmInter.signUp(bean);
		System.out.println("SignUpController: sql 함수를 호출 완료");

		if(result) {
			System.out.println("SignUpController: 회원정보 입력 완료");
			return "redirect:/index.jsp";	//추가 후 로그인 화면으로 이동
		}
		else
			return "redirect:/error.jsp";
	}
}
