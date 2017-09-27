package web_src;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;

import java.util.List;

public class CategoryAds {

    private SessionFactory sessionFactory = ConfigurationUtil.getSessionFactory();
    private Session session;
    private Transaction transaction;

    public CategoryAds(){

    }

    public List<Object> getCategoryAds(Object object){
        List<Object> list = null;
        session = sessionFactory.openSession();
        transaction = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(object.getClass());
            list = criteria.addOrder(Order.desc("id")).list();
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            transaction.rollback();
        }finally {
            session.close();
        }

        return list;
    }
}
