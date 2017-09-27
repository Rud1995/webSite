package mapping;

import javax.persistence.*;

@Entity
@Table(name = "car")
public class Car  extends IdIncrement{

    @Column(name = "location")
    private String location;

    @Column(name = "make")
    private String make;

    @Column(name = "model")
    private String model;

    @Column(name = "year")
    private int year;

    @Column(name = "milage")
    private int milage;

    @Column(name = "engine_type")
    private String engine_type;

    @Column(name = "transmission")
    private String transmission;

    @Column(name = "steering_wheel")
    private String steering_wheel;

    @Column(name = "price")
    private int price;

    @Column(name = "title")
    private String title;

    @Column(name = "description")
    private String description;

    @Column(name = "photo")
    private String photo;

    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    public Car(String location, String make, String model, int year, int milage, String engine_type, String transmission, String steering_wheel, int price, String title, String description, String photo, User user) {
        this.location = location;
        this.make = make;
        this.model = model;
        this.year = year;
        this.milage = milage;
        this.engine_type = engine_type;
        this.transmission = transmission;
        this.steering_wheel = steering_wheel;
        this.price = price;
        this.title = title;
        this.description = description;
        this.photo = photo;
        this.user = user;
    }

    public Car(){
        super();
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getMake() {
        return make;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMilage() {
        return milage;
    }

    public void setMilage(int milage) {
        this.milage = milage;
    }

    public String getEngine_type() {
        return engine_type;
    }

    public void setEngine_type(String engine_type) {
        this.engine_type = engine_type;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }

    public String getSteering_wheel() {
        return steering_wheel;
    }

    public void setSteering_wheel(String steering_wheel) {
        this.steering_wheel = steering_wheel;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
