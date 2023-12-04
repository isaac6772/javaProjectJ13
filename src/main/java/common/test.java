package common;

public class test {
	public static void main(String[] args) {
		SecurityUtil s = new SecurityUtil();
		String pwd = "1234";
		pwd = s.encryptSHA256(pwd);
		System.out.println(pwd);
	}
}
