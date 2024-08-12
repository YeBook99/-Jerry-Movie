package com.ss.cinema.service.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.MyMovieDTO;
import com.ss.cinema.mappers.mypage.myMovieMapper;

@Service
public class myMovieService {
	
	@Autowired
	private myMovieMapper myMoviemapper;
	
	// 영화 예매내역 가져오기
	public List<MyMovieDTO> getMoviePayment(String id) {
		
		return myMoviemapper.getMoviePayment(id);
	}
	
	// 페이지별 영화 예매내역 가져오기
	public List<MyMovieDTO> getPageMoviePayment(int page, int pageSize, String sessionId) {
		int limit = pageSize;
		int offset = (page - 1) * pageSize;
		return myMoviemapper.getPageMoviePayment(limit, offset, sessionId);
	}
	

}
