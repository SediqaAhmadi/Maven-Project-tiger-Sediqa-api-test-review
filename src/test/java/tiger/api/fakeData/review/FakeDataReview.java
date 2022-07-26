package tiger.api.fakeData.review;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.github.javafaker.Faker;


public class FakeDataReview {

	public static String getEmil() {
		Faker faker = new Faker();
		return faker.name().firstName() + faker.name().lastName() + "@gmail.com";

	}
	public static String getName() {
		 Faker faker = new Faker();
		 return faker.name().firstName();
	}
	public static String getLastName() {
		 Faker faker = new Faker();
		 return faker.name().lastName();
}
	public static String getTitle() {
		 Faker faker = new Faker();
		 return faker.name().title();
	}
	
	public static String getDob() {
		Faker faker = new Faker();
        Date date = faker.date().birthday();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
        return format.format(date);
    }
	public static String getPhone() {
		 Faker faker = new Faker();
		 return faker.phoneNumber().phoneNumber();
}
	public static String getExtention() {
		 Faker faker = new Faker();
		 return faker.phoneNumber().extension();
		 
	}
	
	public static String getStreetAddress() {
		 Faker faker = new Faker();
		 return faker.address().streetAddress();
		 }
	
	public static String getCityName() {
		 Faker faker = new Faker();
		 return faker.address().cityName();
}
	public static String getStateName() {
		 Faker faker = new Faker();
		 return faker.address().state();
}
	public static String getPostalCode() {
		 Faker faker = new Faker();
		 return faker.address().zipCode();
	}
	
}
