package com.mall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mall.dao.set.SetDao;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/set")
@RequiredArgsConstructor
public class SetController {
	
	private final SetDao setDao;
	
	//세트판매 메인페이지로 이동
	@RequestMapping("")
	public String setPage(Model model) {
		model.addAttribute("setList", setDao.findAll());
		model.addAttribute("compList", setDao.findAllComponents());
		return "/setProducts";
	}
	
}
