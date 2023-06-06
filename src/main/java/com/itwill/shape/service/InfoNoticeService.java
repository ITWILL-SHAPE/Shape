package com.itwill.shape.service;
import java.util.List;

// 우수빈 notice service
import org.springframework.stereotype.Service;

import com.itwill.shape.dto.InfoNoticeListDto;
import com.itwill.shape.repository.InfoNoticeRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
// 우수빈 notice service
@Service
@RequiredArgsConstructor
@Slf4j
public class InfoNoticeService {

		private final InfoNoticeRepository infoNoticeRepository;
		// 좋은 코드는 기능 단위의 분리가 정확히 있어야 한다 -은제
}
