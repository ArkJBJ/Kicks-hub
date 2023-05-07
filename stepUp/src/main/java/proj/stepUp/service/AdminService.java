package proj.stepUp.service;

import java.util.List;

import proj.stepUp.vo.SlideVO;

public interface AdminService {
	
	public int slideinsert(SlideVO slvo);
	public List<SlideVO> slideSelect();
}
