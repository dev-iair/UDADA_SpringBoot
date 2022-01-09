package ga.udada.udada.exercise;


import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ExercisePageRequestDTO {
	
	private int pageNum;
	private int pageSize;
	private String keyword;
	private String loginUser;
	
	public ExercisePageRequestDTO() {
		this(1,10,"");
	}

	public ExercisePageRequestDTO(int pageNum, int pageSize) {
		this.pageNum=pageNum;
		this.pageSize=pageSize;
	}
	
	public ExercisePageRequestDTO(int pageNum, int pageSize, String keyword) {
		this.pageNum=pageNum;
		this.pageSize=pageSize;
		this.keyword=keyword;
	}
	
	public ExercisePageRequestDTO(int pageNum, int pageSize, String keyword, String loginUser) {
		this.pageNum=pageNum;
		this.pageSize=pageSize;
		this.keyword=keyword;
		this.loginUser=loginUser;
	}
}