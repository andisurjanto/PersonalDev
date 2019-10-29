public class StringArrayTest {
	
	public static List<String> generateStringArray(Integer no) {
		List<String> tmpList = new List<String>();
		for (Integer i=0; i < no;i++) {
			tmpList.add('Test ' + i);
		}

		return tmpList;
	}
}