package mapping;

import javax.persistence.*;

@Entity
@Table(name = "tablet")
public class Tablet extends IdIncrement{

    @Column(name = "location")
    private String location;

    @Column(name = "make")
    private String make;

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

    @Override
    public String toString() {
        return "Tablet{" +
                "location='" + location + '\'' +
                ", make='" + make + '\'' +
                ", price=" + price +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", photo='" + photo + '\'' +
                ", user=" + user +
                '}';
    }

    public Tablet(String location, String make, int price, String title, String description, String photo, User user) {
        this.location = location;
        this.make = make;
        this.price = price;
        this.title = title;
        this.description = description;
        this.photo = photo;
        this.user = user;
    }

    public Tablet(){
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
