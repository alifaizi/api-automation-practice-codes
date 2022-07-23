package karate.api.test.runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

	@Karate.Test
	Karate runIt() {
		return Karate
				.run("classpath:features")
				.tags("@EndToEndTest");
	} 
}