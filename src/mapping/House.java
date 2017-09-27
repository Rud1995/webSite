package mapping;

import javax.persistence.*;

@Entity
@Table(name = "house")
public class House  extends IdIncrement{

    @Column(name = "location")
    private String location;

    @Column(name = "address")
    private String address;

    @Column(name = "coustruction_type")
    private String coustruction_type;

    @Column(name = "rooms")
    private int rooms;

    @Column(name = "living_space")
    private int living_space;

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

    public House(String location, String address, String coustruction_type, int rooms, int living_space, int price, String title, String description, String photo, User user) {
        this.location = location;
        this.address = address;
        this.coustruction_type = coustruction_type;
        this.rooms = rooms;
        this.living_space = living_space;
        this.price = price;
        this.title = title;
        this.description = description;
        this.photo = photo;
        this.user = user;
    }

    public House(){
        super();
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCoustruction_type() {
        return coustruction_type;
    }

    public void setCoustruction_type(String coustruction_type) {
        this.coustruction_type = coustruction_type;
    }

    public int getRooms() {
        return rooms;
    }

    public void setRooms(int rooms) {
        this.rooms = rooms;
    }

    public int getLiving_space() {
        return living_space;
    }

    public void setLiving_space(int living_space) {
        this.living_space = living_space;
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

    @Override
    public String toString() {
        return "House{" +
                "location='" + location + '\'' +
                ", address='" + address + '\'' +
                ", coustruction_type='" + coustruction_type + '\'' +
                ", rooms=" + rooms +
                ", living_space=" + living_space +
                ", price=" + price +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", photo='" + photo + '\'' +
                ", user=" + user +
                '}';
    }
}
