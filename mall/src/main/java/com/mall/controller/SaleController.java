package com.mall.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mall.dao.product.ProductDao;
import com.mall.dao.sale.SaleDao;
import com.mall.util.AdminUtil;
import com.mall.vo.product.ProductVo;
import com.mall.vo.sale.SaleVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/timesale")
@RequiredArgsConstructor
public class SaleController {
	
	private final ProductDao dao;
	private final SaleDao sdao;
	
	//타임세일 메인페이지로 이동
	@RequestMapping("")
	public String timesalePage(Model model) {
		model.addAttribute("list", sdao.selectValid());
		return "/timesale";
	}
	
}
