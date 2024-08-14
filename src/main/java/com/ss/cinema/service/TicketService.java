package com.ss.cinema.service;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.CardDTO;
import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.PaymentDTO;
import com.ss.cinema.dto.SeatDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.mappers.TicketMapper;

@Service
public class TicketService {

	@Autowired
	private TicketMapper ticketMapper;
	
	// 영화 리스트 Mapper
	public List<movieDTO> getMovieList(List<Map<String, Object>> menuList) {
		
		// HashMap으로 초기화
		Map<String, Object> menuHashMap = MapSet(menuList);
		
		return ticketMapper.getMovieList(menuHashMap);
	}

	// 영화관 리스트 Mapper
	public List<CinemaDTO> getCinemaList(List<Map<String, Object>> menuList) {
		
		Map<String, Object> menuHashMap = MapSet(menuList);
		
		return ticketMapper.getCinemaList(menuHashMap);
	}

	
	
	// 영화관 날짜 리스트 Mapper
	public List<CinemaDTO> getCinemaDateList(List<Map<String, Object>> menuList) {
		
		Map<String, Object> menuHashMap = MapSet(menuList);
		
		return ticketMapper.getCinemaDateList(menuHashMap);
	}
	
	public List<TheaterDTO> getTheaterList(List<Map<String, Object>> menuList) {
		
		Map<String, Object> menuHashMap = MapSet(menuList);
		
		return ticketMapper.getTheaterList(menuHashMap);
	}

	private Map<String, Object> MapSet(List<Map<String, Object>> menuList){
		// HashMap으로 초기화
        Map<String, Object> menuHashMap = new HashMap<String, Object>();
        
        for(Map<String, Object> map : menuList) {
        	for(Map.Entry<String, Object> entry : map.entrySet()) {
        		if(entry.getValue().toString().isEmpty()) {
        			menuHashMap.put(entry.getKey(), null);
        		}else {
        			menuHashMap.put(entry.getKey(), entry.getValue());
        		}
        		
        	}
        }
		
        return menuHashMap;
	}
	
	
	// 좌석 리스트
	public List<SeatDTO> getSeatList(Map<String, Object> theaterNo) {
		
		return ticketMapper.getSeatList(theaterNo);
	}

	public List<CardDTO> getCardList() {
		
		return ticketMapper.getCardList();
	}

	public MemberDTO getMemberById(String memId) {
		
		return ticketMapper.getMemberById(memId);
	}

	public void insertTicket(Map<String, Object> insertMap) {
		
		Map<String, Object> dbMap = new HashMap<String, Object>();
		System.out.println("서비스");
		

		// 좌석 insert
		String[] seatArray = insertMap.get("leftSeatNum").toString().split(",\\s*");
		int[][] resultArray = new int[seatArray.length][2];
		
		for (int i = 0; i < seatArray.length; i++) {
		    String seat = seatArray[i];

		    char rowChar = seat.charAt(0);
		    int rowNumber = rowChar - 65;

		    resultArray[i][0] = rowNumber;
		    resultArray[i][1] = Integer.parseInt(seat.substring(1)) -1;
		}
		
		for(int row = 0; row < resultArray.length; row++) {
			ticketMapper.insertSeat(insertMap.get("theaterNo"),resultArray[row][0],resultArray[row][1]);
		}
		
		
		
		// 결제 내역
		String paymentDate = (String)insertMap.get("paymentDate");
		long timestamp = Long.parseLong(paymentDate); // 문자열을 long 타입으로 변환
		System.out.println("long " + timestamp);

		Date date = new Date(timestamp); // 타임스탬프를 Date 객체로 변환

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String formattedDate = sdf.format(date);
		System.out.println("서비스 formattedDate " + formattedDate);
        
        dbMap.put("theaterNo", insertMap.get("theaterNo"));
		dbMap.put("cardNo", insertMap.get("cardNo"));
		dbMap.put("paymentType", insertMap.get("paymentType"));
		dbMap.put("paymentDate", formattedDate);
		dbMap.put("paymentPrice", insertMap.get("paymentPrice"));
		dbMap.put("memberId", insertMap.get("memberId"));
		dbMap.put("movieNo", insertMap.get("movieNo"));
		dbMap.put("cinemaNo", insertMap.get("cinemaNo"));
		dbMap.put("seatNum", insertMap.get("leftSeatNum"));
		dbMap.put("ticketTeen", insertMap.get("ticketTeen"));
		dbMap.put("ticketAdult", insertMap.get("ticketAdult"));
		dbMap.put("ticketSenior", insertMap.get("ticketSenior"));
		System.out.println("서비스 dbMap " + dbMap);
		
		ticketMapper.insertPayment(dbMap);
		
		
		PaymentDTO paymentDTO = ticketMapper.getPayment(dbMap);
		dbMap.put("paymentNo", paymentDTO.getPaymentNo());
		
		
		ticketMapper.insertTicket(dbMap);

		System.out.println("서비스 완료");
		
	//	ticketTeen
//		ticketAdult
//		ticketSenior
	}


}