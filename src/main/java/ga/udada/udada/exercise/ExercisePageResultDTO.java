package ga.udada.udada.exercise;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ExercisePageResultDTO {
	
	private ExercisePageRequestDTO exercisePageRequestDTO;
	private int start,end;
	private boolean prev,next;
	private int total;
	
	public ExercisePageResultDTO(ExercisePageRequestDTO exercisePageRequestDTO, int total) {
		this.exercisePageRequestDTO = exercisePageRequestDTO;
		this.total = total;
		

		int realEnd = (int)(Math.ceil((total*1.0)/exercisePageRequestDTO.getPageSize()));
		this.end = (int)(Math.ceil(exercisePageRequestDTO.getPageNum()/10.0))*10;
		this.start = end-9 <= 0 ? 1 : end-9;
		if(realEnd < this.end) {
			this.end = realEnd;
		}
		this.prev = this.start > 1;
		this.next = this.end < realEnd;
	}

}
