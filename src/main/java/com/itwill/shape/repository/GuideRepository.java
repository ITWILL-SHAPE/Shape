package com.itwill.shape.repository;

import com.itwill.shape.domain.Guide;

public interface GuideRepository {

	// Repository 작명 방법
	// : Domain에 추가 되는 DB TABLE 개수만큼 추가.
	// : TABLE 이름 + Repository
	// ex> GuideRepository	
	
	// Repository 작성 방법
	// : 해당 메소드 작성 후, mappers의 xml 파일에 id와 일치하는지 비교.
	// : 해당 메소드 작성자 및 해당 메소드의 역할 작성.
	
	/**
	 * 0531 하지윤
	 * Guide table에 title, content, author과 같은 not null 컬럼을
	 * 채워 추가 후 추가된 행 개수 리턴
	 * 
	 * @param guide
	 * @return 0 or 1
	 */
	int insert(Guide guide);
}
