package web_src;

import mapping.*;
import org.hibernate.*;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SubcategoryAds {

    private SessionFactory sessionFactory = ConfigurationUtil.getSessionFactory();
    private Session session = sessionFactory.openSession();
    private Transaction transaction = session.beginTransaction();

    public SubcategoryAds(){

    }

    public List<Object> getAdsBySubcategory(Object object, String image, String minPrice, String maxPrice, String location){
        List<Object> list = null;
        Session sessionCurrent = session.getSession();
        try{
            Criteria criteria = sessionCurrent.createCriteria(object.getClass());
            if(image != null) {
                criteria.add(Restrictions.isNotNull("photo"));
            }

            if(minPrice != null && maxPrice != null){
                if(!minPrice.equals("") && !maxPrice.equals("")) {
                    criteria.add(Restrictions.between("price", Integer.parseInt(minPrice), Integer.parseInt(maxPrice)));
                }else if(!minPrice.equals("") && maxPrice.equals("")) {
                    criteria.add(Restrictions.between("price", Integer.parseInt(minPrice), 2000000));
                }else if(minPrice.equals("") && !maxPrice.equals("")) {
                    criteria.add(Restrictions.between("price", 0, Integer.parseInt(maxPrice)));
                }
            }

            if(location != null){
                criteria.add(Restrictions.eq("location", location));
            }

            list = criteria.addOrder(Order.desc("id")).list();
            transaction.commit();
        }catch(TransactionException te){
            te.getMessage();
            transaction.rollback();
        }

        return list;
    }
}
