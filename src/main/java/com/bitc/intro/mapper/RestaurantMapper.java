package com.bitc.intro.mapper;

import java.util.List;

import com.bitc.intro.domain.Criteria;
import com.bitc.intro.domain.CriteriaDetail;
import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.domain.Restaurant;

public interface RestaurantMapper {
	
	void insert(Restaurant restaurant);
	
	Restaurant getRestaurantById(int rid);
	
	List<Restaurant> getRestaurantsWithPaging(Criteria cri);
	
	int getTotalCount();
	
	void deleteById(int rid);
	
	void updateRestaurantById(Restaurant resutaurant);
	
	// 관광지 detail의 페이징 용 맵퍼 
	int getTotalCountBySpotId(Hotspot hotspot);
	
	List<Restaurant> getRestaurantsBySpotIdWithPage(Hotspot param1, CriteriaDetail param2);
	
	int getLoveCount(int rid);
	
	Integer getRecommendationsByage(int rid);
	
	String getRecommendationsByGender(int rid);
	
	void increaseLove(int rid);
	
	void decreaseLove(int rid);
	
	List<String> getdistrictsByloveCounts();
	
	List<Integer> getrestsloveCounts();
	
	List<Restaurant> getrestsBydistrict(String district);
	
	List<Restaurant> getrestsBymainmenu();
	
	int nextRid();
}	
