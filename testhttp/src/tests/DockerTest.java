package tests;
import utils.HttpRequestUtils;
public class DockerTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int port=80;//1100
		for(port=1100;port<=9999;port++){
			String ret=HttpRequestUtils.sendGet("http://104.236.151.44:"+port+"/containers/json", "all=1");
			System.out.println("port: "+port+"\t"+ret);
			if(ret.length()>0)
				break;
		}		
	}

}
