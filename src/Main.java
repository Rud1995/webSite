import mapping.House;
import mapping.Tablet;
import mapping.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import web_src.ConfigurationUtil;
import web_src.UserAds;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        SessionFactory sessionFactory = ConfigurationUtil.getSessionFactory();
        /*Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            User u = (User) session.get(User.class, 3L);
            u.setName("Andranik");
            session.delete(u);
            transaction.commit();
        }catch(TransactionException te){
            te.getStackTrace();
            transaction.rollback();
        }finally {
            session.close();
            sessionFactory.close();
        }
        User user = (User)session.get(User.class, 3L);
        session.delete(user);
        session.createSQLQuery("insert into user(address, age, email, name, password, phone, surname, username) values('yerevan', 21, 'mkkijnub', 'chalo', 'jeko', 124563, 'vvfrfrf', 'rerfrfr')").executeUpdate();
   */
        UserAds userAds = new UserAds();
        Session session = sessionFactory.openSession();
        User user = session.get(User.class, 8L);
        /*House house = new House("Ejmiacin", "Saxarov", "bazalt", 3, 40,
                15000, "I am selling my 3 rooms", "some description 2", null, user);

        Tablet tablet = new Tablet("Goris", "Alcatel", 500, "vacharvume samsung tablet", "tablet desc", null, user);
        userAds.addAds(tablet);*/

        List<Object[]> list = userAds.readAds(user.getId());
        Object[] object1 = list.get(0);
        for (int i = 0; i < object1.length; i++) {
            House house = (House) object1[i];
            System.out.println(house.toString());
        }

        Object[] object2 = list.get(1);
        for (int i = 0; i < object2.length; i++) {
            Tablet tablet = (Tablet) object2[i];
            System.out.println(tablet.toString());
        }
    }
}
