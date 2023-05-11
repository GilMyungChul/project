package programmers;
import java.util.*;

/*
 * 	프로그래머스 - https://school.programmers.co.kr/learn/courses/30/lessons/12910
 
 	- 문제 설명
	array의 각 element 중 divisor로 나누어 떨어지는 값을 오름차순으로 정렬한 배열을 반환하는 함수, solution을 작성해주세요.
	divisor로 나누어 떨어지는 element가 하나도 없다면 배열에 -1을 담아 반환하세요.
	
	- 제한사항
	· arr은 자연수를 담은 배열입니다.
	· 정수 i, j에 대해 i ≠ j 이면 arr[i] ≠ arr[j] 입니다.
	· divisor는 자연수입니다.
	· array는 길이 1 이상인 배열입니다.
*/


public class Study03 {
	
	public static void main(String[] args) {
		int[] arr = {3, 2, 6};
		int divisor = 10;
		
		Solution03 s = new Solution03();
		s.solution(arr, divisor);
		
	}
	
}

class Solution03 {
	public Integer[] solution(int[] arr, int divisor) {
		List<Integer> list = new ArrayList<Integer>();
		Arrays.sort(arr);
		
		for (int n = 0; n < arr.length; n++) {
			if (arr[n] % divisor == 0) {
				list.add(arr[n]);
			}
		}
		
		if (list.size() == 0) {
			list.add(-1);
		}
		
		Integer[] answer = list.toArray(new Integer[0]);
		
        return answer;
    }
}