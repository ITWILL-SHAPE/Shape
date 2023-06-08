package com.itwill.shape.service;
import java.util.List;

// 우수빈 notice service
import org.springframework.stereotype.Service;

import com.itwill.shape.domain.InfoNotice;
import com.itwill.shape.dto.InfoNoticeListDto;
import com.itwill.shape.dto.InfoNoticeCreateDto;
import com.itwill.shape.dto.InfoNoticeUpdateDto;
import com.itwill.shape.repository.InfoNoticeRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
// 우수빈 notice service
@Service
@RequiredArgsConstructor
@Slf4j
public class InfoNoticeService {

		private final InfoNoticeRepository infoNoticeRepository;
		
		
		/**
		 * notice 리스트 페이지
		 * @return
		 */
		public List<InfoNoticeListDto> read() {
			log.info("read()");
			return infoNoticeRepository.selectOrderByDateDesc();
		}
		
		/**
		 * notice create 페이지
		 * @param notice
		 * @return
		 */
		public int create(InfoNoticeCreateDto dto) {
			log.info("create({})", dto);
			return infoNoticeRepository.insert(dto.toEntity());
		}
		
		/**
		 * notice detail
		 * @param nid
		 * @return
		 */
		public InfoNotice read(long nid) {
			log.info("read({})", nid);
			InfoNotice entity = infoNoticeRepository.selectByNid(nid);
//			entity.setViews(infoNoticeRepository.viewCount(nid));
			return entity;
		}
		
		/**
		 * 조회수
		 * @param nid
		 * @return
		 */
		public int viewCount(long nid) {
			log.info("viewCount({})", nid);
			return infoNoticeRepository.viewCount(nid);
		}
		
		/**
		 * notice 수정 관리자
		 * @param dto
		 * @return
		 */
		public int update(InfoNoticeUpdateDto dto) {
			log.info("update({})", dto);
			return infoNoticeRepository.updateNotice(dto.toEntity());
		}
		
		/**
		 * notice 삭제 관리자
		 * @param nid
		 * @return
		 */
		public int delete(long nid) {
			log.info("delete({})", nid);
			return infoNoticeRepository.deleteByNid(nid);
		}
		
		
}
