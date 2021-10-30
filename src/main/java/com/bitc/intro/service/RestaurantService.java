package com.bitc.intro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.intro.domain.AttachVO;
import com.bitc.intro.domain.Criteria;
import com.bitc.intro.domain.CriteriaDetail;
import com.bitc.intro.domain.Hotspot;
import com.bitc.intro.domain.Restaurant;
import com.bitc.intro.repository.AttachRepository;
import com.bitc.intro.repository.RestaurantRepository;

@Service
@Transactional
public class RestaurantService {

	
	@Autowired
	private RestaurantRepository restaurantRepository;
	
	@Autowired
	private AttachRepository attachRepository;
	
	public void insert(Restaurant restaurant) {
		restaurantRepository.insert(restaurant);
	};
	
	public Restaurant getRestaurantById(int rid) {
		return restaurantRepository.getRestaurantById(rid);
	};
	
	public List<Restaurant> getRestaurantsWithPaging(Criteria cri) {
		return restaurantRepository.getRestaurantsWithPaging(cri);
	};
	
	public int getTotalCount() {
		return restaurantRepository.getTotalCount();
	}
	
	@Transactional
	public void deleteById(int rid) {
		restaurantRepository.deleteById(rid);
		attachRepository.deleteAllAttach(rid);
	};
	
	@Transactional
	public void updateRestandAttach(Restaurant restaurant) {
		attachRepository.deleteAllAttach(restaurant.getRid());
		restaurantRepository.updateRestaurantById(restaurant);
		
		if(restaurant.getAttachList() != null && restaurant.getAttachList().size() != 0) {
			restaurant.getAttachList().forEach(attach -> {
				attach.setRestId(restaurant.getRid());
				attachRepository.insertAttach(attach);
			});
		}
	};
	
	public int getTotalCountBySpotId(Hotspot hotspot) {
		return restaurantRepository.getTotalCountSpotId(hotspot);
	};
	
	public List<Restaurant> getRestaurantsBySpotIdWithPage(Hotspot hotspot, CriteriaDetail cri) {
		return restaurantRepository.getRestaurantsBySpotIdWithPage(hotspot, cri);
	};
	
	public int getLoveCount(int rid) {
		return restaurantRepository.getLoveCount(rid);
	}
	
	public Integer getRecommendationsByage(int rid) {
		return restaurantRepository.getRecommendationsByage(rid);
	}
	
	public String getRecommendationsByGender(int rid) {
		return restaurantRepository.getRecommendationsByGender(rid);
	}

	public void increaseLove(int rid) {
		restaurantRepository.increaseLove(rid);
	}
	
	public void decreaseLove(int rid) {
		restaurantRepository.decreaseLove(rid);
	}
	
	public List<String> getdistrictsByloveCounts() {
		return restaurantRepository.getdistrictsByloveCounts();
	}
	
	public List<Integer> getrestsloveCounts() {
		return restaurantRepository.getrestsloveCounts();
	}
	
	public List<Restaurant> getrestsBydistrict(String district) {
		return restaurantRepository.getrestsBydistrict(district);
	}
	
	public List<Restaurant> getrestsBymainmenu() {
		return restaurantRepository.getrestsBymainmenu();
	}
	
	public int nextRid() {
		return restaurantRepository.nextRid();
	}
	
	@Transactional // restaurant , attachList insert 트렌잭션 처리
	public void insertRestaurantAndAttaches(Restaurant restaurant, List<AttachVO> attachList) {
		
		restaurantRepository.insert(restaurant);
		
		if(attachList.size() > 0) {
			for ( AttachVO attachVO : attachList ) {
				attachRepository.insertAttach(attachVO); // 첨부파일 정보 등록 개수 만큼
			}
		}
	}
	
}
