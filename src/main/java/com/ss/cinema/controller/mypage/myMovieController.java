package com.ss.cinema.controller.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.service.mypage.myStampService;

@Controller
public class myMovieController {

	@Autowired
	private myStampService myStampservice;

	@RequestMapping("/myMovie")
	public String myMovie(Model model) {

		// 로그인 아이디 멤버 정보 가져오기
		MemberDTO member = myStampservice.getStmap("1");

		// 스탬프 개수 9와 비교
		if (member.getMemberStamp() >= 9) {
			member.setMemberStamp(member.getMemberStamp() - 9);
			member.setMemberCoupon(member.getMemberCoupon() + 1);

			// 스탬프, 쿠폰 개수 수정해서 업데이트
			myStampservice.setCoupon(member);
		}
		model.addAttribute("member", member);

		return "mypage/myMovie";
	}
}