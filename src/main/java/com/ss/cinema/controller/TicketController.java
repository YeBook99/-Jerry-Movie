package com.ss.cinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.service.TicketService;

@Controller
public class TicketController {

	@Autowired
	private TicketService ticketService;

	@RequestMapping("/d")
	public String ticketMenu(Model model, CinemaDTO cinemaDTO, TheaterDTO theaterDTO) {
		System.out.println("TicketController ticketMenu");

//		// 예매율 순
//		List<movieDTO> movieList = ticketService.getMovieList(cinemaDTO);
//		System.out.println(movieList);
//		// 상영관 리스트
//		List<CinemaDTO> cinemaList = ticketService.getCinemaList(movieList);
//		System.out.println(cinemaList);
//
//		model.addAttribute("movieList", movieList);
//		model.addAttribute("cinemaList", cinemaList);

		return "ticket/ticket";
	}

	@RequestMapping("/f")
	public String ticketSeate(Model model, CinemaDTO cinemaDTO, TheaterDTO TheaterDTO) {

		return "ticket/ticketSeat";
	}

	// 영화 리스트 ajax
	@RequestMapping("/ticket/movieList")
	@ResponseBody
	public List<movieDTO> movieList(Model model, CinemaDTO cinemaDTO, TheaterDTO theaterDTO) {
		System.out.println("TicketController movieList");
		
		
		List<movieDTO> movieList = ticketService.getMovieList(cinemaDTO);

		return movieList;
	}

	
	//영화관 리스트 ajax
	@RequestMapping("/ticket/cinemaList")
	@ResponseBody
	public List<CinemaDTO> cinemaList(Model model, @RequestBody List<movieDTO> movieList) { 	 
		System.out.println("TicketController cinemaList");
 
		List<CinemaDTO> cinemaList = ticketService.getCinemaList(movieList);
 
		return cinemaList; 
	}
	 
}
