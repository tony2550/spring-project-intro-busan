package com.bitc.intro.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.compiler.ast.InstanceOfExpr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitc.intro.domain.CalCoords;
import com.bitc.intro.domain.Coords;
import com.bitc.intro.domain.Grade;
import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.domain.Review;
import com.bitc.intro.service.HotspotService;
import com.bitc.intro.service.RestaurantService;
import com.bitc.intro.service.ReviewService;
import com.bitc.intro.service.UserService;

import lombok.extern.java.Log;

@Controller
@Log
public class HomeController {
	@Autowired
	private RestaurantService restaurantService;
	
	@Autowired
	private HotspotService HotspotService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String index(Model model) {
		
		List<String> districts = restaurantService.getdistrictsByloveCounts();
		List<Integer> lovecounts = restaurantService.getrestsloveCounts();
		
		model.addAttribute("districts", districts);
		model.addAttribute("lovecounts", lovecounts);
		
		return "index";
	}
	
	@GetMapping("age/{age}")
	public String index(@PathVariable int age, Model model) {
	
		List<Integer> agerestId = userService.ageReco(age);
		
		List<Restaurant> restList = new ArrayList();
		for (Integer restId : agerestId) {
			Restaurant rest = restaurantService.getRestaurantById(restId);
			restList.add(rest);
		}
		
		model.addAttribute("restList", restList);
		model.addAttribute("age", age);
		return "hotspot/agedetail";
	}
	
	@GetMapping("district")
	public String district(String district, Model model) {
		List<Restaurant> restList = restaurantService.getrestsBydistrict(district);
		model.addAttribute("restList",restList);
		model.addAttribute("district", district);
		return "hotspot/district";
	}
	
	@GetMapping("coffee")
	public String coffee(Model model) {
		List<Restaurant> restList = restaurantService.getrestsBymainmenu();
		model.addAttribute("restList",restList);
		return "hotspot/coffedetail";
	}
	
	@GetMapping("/test")
	public String kakaotest(Model model,HttpServletResponse response) {
		
		response.addHeader("Set-Cookie", "Test3=TestCookieValue3;   Secure; SameSite=None");
		
		Restaurant restaurant=restaurantService.getRestaurantById(236);
		System.out.println(restaurant.getAddress());
		model.addAttribute("restaurant", restaurant);
		
		return "test";	
	}
	
	
	@GetMapping("/restaurantdetailtest")
	public String resttest(Model model) {
		
		return "restaurantdetailtest";
		
	}
	
	
	
	
	
	
}
