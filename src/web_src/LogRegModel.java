package web_src;
import mapping.*;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

import java.util.List;

public class LogRegModel {

    private User user = null;
    private SessionFactory sessionFactory = ConfigurationUtil.getSessionFactory();

    public LogRegModel(){

    }

    public User getUser(String username, String password){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(User.class);
            criteria.add(Restrictions.and(Restrictions.eq("username", username), Restrictions.eq("password", password)));
            if (criteria.list().size() != 0) {
                user = (User) criteria.list().get(0);
            }
            transaction.commit();
        }catch(TransactionException tr){
            tr.getStackTrace();
            transaction.rollback();
        }finally {
            session.close();
        }
        return user;
    }

    public boolean saveNewUser(String name, String surname, String username, String password, byte age,
                               String address, String email, int phone){
        Session session = sessionFactory.openSession();
        Criteria criteria = session.createCriteria(User.class);
        criteria.add(Restrictions.or(Restrictions.eq("username", username), Restrictions.eq("password", password)));
        if(criteria.list().size() == 0){
            Transaction transaction = session.beginTransaction();
            try {
                User newUser = new User(name, surname, username, password, age, address, email, phone);
                session.save(newUser);
                transaction.commit();
            }catch(TransactionException tr){
                tr.getStackTrace();
                transaction.rollback();
            }finally {
                session.close();
            }
            return true;
        }else {
            return false;
        }
    }

    public User updateUserInfo(long id, String name, String surname, String username, byte age, String address, String email, int phone){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        User user = null;
        try {
            user = session.get(User.class, id);
            user.changeData(name, surname, username, age, address, email, phone);
            session.update(user);
            transaction.commit();
        }catch(TransactionException te){
            te.getStackTrace();
            transaction.rollback();
        }finally {
            session.close();
        }

        return user;
    }

    public void deleteUser(long id){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            User user = session.get(User.class, id);
            List<Apartment> apartments = user.getApartments();
            if (apartments != null) {
                for (Apartment a : apartments) {
                    session.delete(session.get(Apartment.class, a.getId()));
                }
            }
            List<Car> cars = user.getCars();
            if (cars != null) {
                for (Car a : cars) {
                    session.delete(session.get(Car.class, a.getId()));
                }
            }
            List<House> houses = user.getHouses();
            if (houses != null) {
                for (House a : houses) {
                    session.delete(session.get(House.class, a.getId()));
                }
            }
            List<Motorcycle> motorcycles = user.getMotorcycles();
            if (motorcycles != null) {
                for (Motorcycle a : motorcycles) {
                    session.delete(session.get(Motorcycle.class, a.getId()));
                }
            }
            List<Notebook> notebooks = user.getNotebooks();
            if (notebooks != null) {
                for (Notebook a : notebooks) {
                    session.delete(session.get(Notebook.class, a.getId()));
                }
            }
            List<Phone> phones= user.getPhones();
            if (phones != null) {
                for (Phone a : phones) {
                    session.delete(session.get(Phone.class, a.getId()));
                }
            }
            List<Tablet> tablets = user.getTablets();
            if (tablets != null) {
                for (Tablet a : tablets) {
                    session.delete(session.get(Tablet.class, a.getId()));
                }
            }

            session.delete(user);
            transaction.commit();
        }catch(TransactionException te){
            te.getStackTrace();
            transaction.rollback();
        }finally {
            session.close();
        }
    }
}
