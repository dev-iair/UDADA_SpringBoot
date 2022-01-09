package ga.udada.udada.calendar;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CalendarController {
	
	private final CalendarService calendarService;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/member/calendar")
	@ResponseBody
	public ResponseEntity<List<CalendarDTO>> getList(Authentication auth) throws Exception{
					
		List<CalendarDTO> list = calendarService.listSevenDays(auth.getName());

		return new ResponseEntity<>(list,HttpStatus.OK);
		
	}


	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/member/calendar")
	public void getCalendarPage() {
		
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/member/calendarMonth")
	@ResponseBody
	public ResponseEntity<List<CalendarDTO>> getListMonth(Authentication auth ,@RequestBody Map<String,String> params ) throws Exception{
			
		String calendarDate = params.get("calendarDate");
		List<CalendarDTO> list = calendarService.listMonth(calendarDate, auth.getName());

		return new ResponseEntity<>(list,HttpStatus.OK);
		
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/member/calendarMonth")
	public void getCalendarMonthPage() {
		
	}
	
}
