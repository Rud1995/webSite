package web_src;

import mapping.User;
import org.hibernate.*;

public class UserImageControl {

    private SessionFactory sessionFactory = ConfigurationUtil.getSessionFactory();

    public UserImageControl(){

    }

    public User savePhoto(long userId, String path){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        User user = null;
        try{
            user = (User) session.get(User.class, userId);
            user.setAvatar(path);
            transaction.commit();
        }catch (TransactionException te){
            te.getMessage();
            transaction.rollback();
        }finally {
            session.close();
        }

        return user;
    }

    public User deletePhoto(long userId){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        User user = null;
        try {
            user = session.get(User.class, userId);
            user.setAvatar(null);
            session.save(user);

            transaction.commit();
        } catch (TransactionException te) {
            te.getMessage();
            transaction.rollback();
        }finally {
            session.close();
        }

        return user;
    }
}
