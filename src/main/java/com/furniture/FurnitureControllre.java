package com.furniture;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.furniture.Profiles.Profiles;
import com.furniture.Profiles.ProfilesDAO;
import com.furniture.cart.Cart;
import com.furniture.cart.CartDAO;
import com.furniture.categories.Categories;
import com.furniture.categories.CategoriesDAO;
import com.furniture.products.Products;
import com.furniture.products.ProductsDAO;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class FurnitureControllre {
	
	@Autowired
	ProductsDAO pdao;
	@Autowired
	ProfilesDAO pfdao;
    @Autowired
    CategoriesDAO cdao;
    @Autowired
    CartDAO cartdao;
    
    
    public String LoginTest()
	{
	    //Date d = null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	
	    	System.out.println(auth.getName());
	
	    	return "true";
	    }
		
		return "false";
	}
	
    @RequestMapping(value="/loginpage",method=RequestMethod.GET)
	public ModelAndView login()
	{
		ModelAndView m2 = new ModelAndView("loginpage");
			
		return m2;
	}
	
    
	@RequestMapping("/index")
	public ModelAndView index()
	{
		ModelAndView mv = new ModelAndView("index");
		
		mv.addObject("linus", "linus");
		
		return mv;
	}
	
	@RequestMapping("/AboutUs")
	public ModelAndView AboutUs()
	{
		ModelAndView mv = new ModelAndView("AboutUs");
		
		mv.addObject("linus", "linus");
		
		return mv;
	}
	
	@RequestMapping("/ContactUs")
	public ModelAndView ContactUs()
	{
		ModelAndView mv = new ModelAndView("ContactUs");
		
		mv.addObject("linus", "linus");
		
		return mv;
	}
	
	@RequestMapping("/Dashboard")
	public ModelAndView Dashboard()
	{
		ModelAndView mv = new ModelAndView("Dashboard");
		
		return mv;
	}
	

	@RequestMapping(value="/AddCartToDB",method=RequestMethod.POST)
	public ModelAndView AddCartToDB( @RequestParam("quantity") int q,@RequestParam("id")int abc  )
	{
		ModelAndView mv = new ModelAndView("redirect:/cart");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		 if (auth != null && !auth.getName().equals("anonymousUser"))
		 {
		String currUser=auth.getName();
		
		boolean found = false;
		int id = -1;
		
		for( Cart c1 : cartdao.getProductsbyName(currUser) )
		{
			if( c1.getUsername().equals(currUser) && c1.getId()==abc  )
			{
				found = true;
				id = c1.getId();
				break;
		    					
			}
			
		}
		
		if( found )
		{
			Cart c = cartdao.getCartbyId(id);
			
            c.setQuantity(q);
			this.cartdao.update(c);
			System.out.println("updated");
			return mv;

		}

		System.out.println(auth.getName());
		
    	Cart c = new Cart();
		
		c.setUsername( auth.getName() );
		c.setId(abc);
		c.setQuantity(q);
		
		this.cartdao.insert(c);
		
		 }
		 return mv;
	}	

	@RequestMapping("/ViewProduct")
	public ModelAndView ViewProduct()
	{
		ModelAndView mv = new ModelAndView("ViewProduct");
		
		mv.addObject("productdata", pdao.getAllProducts());
		
		return mv;
	}
	
	@RequestMapping("/ViewOneProduct/{id}")
	public ModelAndView ViewOneProduct(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("ViewOneProduct");
		
		mv.addObject("productdata",pdao.getProduct(abc));
		
		return mv;
	}
	
	@RequestMapping("/DeleteOneProduct/{id}")
	public ModelAndView DeleteOneProduct(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewProduct");
		
		pdao.delete(abc);
		
		return mv;
	}
	
	@RequestMapping("/AddProduct")
	public ModelAndView AddProduct()
	{
		ModelAndView mv = new ModelAndView("AddProduct");
		
		return mv;
	}
	
	
	
	
	@RequestMapping(value="/AddProductToDB",method=RequestMethod.POST)
	public ModelAndView AddProductToDB( HttpServletRequest req, @RequestParam("file") MultipartFile file)
	{
		ModelAndView mv = new ModelAndView("Dashboard");
		
		String params[] = req.getParameterValues("product");
		
		Products p = new Products();
		
		for( int i = 0 ; i<params.length ; i++ )
		{
			switch(i)
			{
			case 0:	p.setName(params[i]); break;
			case 1:	p.setDescription(params[i]); break;
			case 2:	p.setCategories(params[i]); break;
			case 3:	p.setPrice(params[i]); break;
			}
		}
			
		
		try
		{
			Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
					  "cloud_name", "manish0407",
					  "api_key", "973945223484417",
					  "api_secret", "TqHUA5nQWfdRqcq3ldqtmbcyTTs"));
			
			String path = req.getRealPath("/");
			
			System.out.println(path);
			
			byte b[] = new byte[file.getInputStream().available()];
			
			file.getInputStream().read(b);
			
			FileOutputStream fos = new FileOutputStream(path + "/image.jpg");
			
			fos.write(b);
			
			fos.close();
			
			File toUpload = new File(path + "/image.jpg");
			
			Map uploadResult = cloudinary.uploader().upload(toUpload, ObjectUtils.emptyMap());
			
			System.out.println(uploadResult.get("secure_url"));
			
			String img = uploadResult.get("secure_url").toString();
			
			System.out.println("Hello");
			
			System.out.println(img);
			
			p.setImage(img);
			
			this.pdao.insert(p);
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return mv;
	}
	
	@RequestMapping("/UpdateOneProduct/{id}")
	public ModelAndView UpdateOneProduct(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("UpdateProduct");
		
		mv.addObject("productdata",pdao.getProduct(abc));
		
		return mv;
	}
	
	@RequestMapping(value="/UpdateProductToDB",method=RequestMethod.POST)
	public ModelAndView UpdateProductToDB( HttpServletRequest req )
	{
		ModelAndView mv = new ModelAndView("redirect:/Dashboard");
		
		String params[] = req.getParameterValues("product");
		
		Products p = new Products();
		
		for( int i = 0 ; i<params.length ; i++ )
		{
			switch(i)
			{
			case 0:	p.setId(Integer.parseInt(params[i])); break;
			case 1:	p.setName(params[i]); break;
			case 2:	p.setDescription(params[i]); break;
			case 3:	p.setCategories(params[i]); break;
			case 4:	p.setPrice(params[i]); break;
			}
		}
			
		this.pdao.update(p);
		
		return mv;
	}
	
//profile curd //
	
	@RequestMapping("/AddProfile")
	public ModelAndView AddProfile()
	{
		ModelAndView mv = new ModelAndView("AddProfile");
		
		mv.addObject("profile", new Profiles());
		
		return mv;
	}
	
	@RequestMapping(value="/AddProfileToDB",method=RequestMethod.POST)
	public ModelAndView AddProfileToDB( HttpServletRequest req,@Valid @ModelAttribute("Profile")Profiles p ,BindingResult result )
	{
		ModelAndView mv = new ModelAndView("redirect:/index");
		
		
		
		if(result.hasErrors())
			
		{
			new ModelAndView("AddProfile");
			mv.addObject("Profile", p);
			System.out.println("error");
			return mv;
		}
		
			
		this.pfdao.insert(p);
		
		System.out.println("inserted");
		return mv;
	}
	
	@RequestMapping("/ViewProfile")
	public ModelAndView ViewProfile()
	{
		ModelAndView mv = new ModelAndView("ViewProfile");
		
		mv.addObject("profiledata", pfdao.getAllProfile());
		
		return mv;
	}
	
	@RequestMapping("/ViewOneProfile/{id}")
	public ModelAndView ViewOneProfile(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("ViewOneProfile");
		
		mv.addObject("profiledata",pfdao.getProfile(abc));
		
		return mv;
	}
	
	@RequestMapping("/DeleteOneProfile/{id}")
	public ModelAndView DeleteOneProfile(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewProfile");
		
		pfdao.delete(abc);
		
		return mv;
	}
	
	@RequestMapping("/UpdateOneProfile/{id}")
	public ModelAndView UpdateOneProfile(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("UpdateProfile");
		
		mv.addObject("profiledata",pfdao.getProfile(abc));
		
		return mv;
	}
	
	@RequestMapping(value="/UpdateProfileToDB",method=RequestMethod.POST)
	public ModelAndView UpdateProfileToDB( HttpServletRequest req )
	{
		ModelAndView mv = new ModelAndView("redirect:/Dashboard");
		
		String params[] = req.getParameterValues("profile");
		
		Profiles pf = new Profiles();
		
		for( int i = 0 ; i<params.length ; i++ )
		{
			switch(i)
			{
			case 0: pf.setId(Integer.parseInt(params[i])); break;
			case 1:	pf.setUsername(params[i]); break;
			case 2:	pf.setEmail(params[i]); break;
			case 3: pf.setPassword(params[i]); break;
			case 4: pf.setPhone(params[i]); break;
			case 5: pf.setAddress(params[i]); break;
			}
		}
		
			
		this.pfdao.update(pf);
		
		return mv;
	}
	
	@RequestMapping("/AddCategories")
	public ModelAndView AddCategories()
	{
		ModelAndView mv = new ModelAndView("AddCategories");
		
		return mv;
	}	
	
	@RequestMapping(value="/AddCategoryToDB",method=RequestMethod.POST)
	public ModelAndView AddCategoryToDB( HttpServletRequest req )
	{
		ModelAndView mv = new ModelAndView("Dashboard");
		
		String params[] = req.getParameterValues("category");
		
		Categories cg = new Categories();
		
		for( int i = 0 ; i<params.length ; i++ )
		{
			switch(i)
			{
			case 0:	cg.setName(params[i]); break;
			case 1:	cg.setDescription(params[i]); break;
			
			}
		}
			
		this.cdao.insert(cg);
		
		return mv;
	}
	
	@RequestMapping("/ViewCategories")
	public ModelAndView ViewCategories()
	{
		ModelAndView mv = new ModelAndView("ViewCategories");
		
		mv.addObject("categoriesdata", cdao.getAllCategories());
		
		return mv;
	}
	
	/*@RequestMapping("/UpdateOneCategories/{id}")
	public ModelAndView UpdateOneCategories(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("UpdateCategories");
		
		mv.addObject("categoriesdata",cdao.getCategories(abc));
		
		return mv;
	}*/
	
	@RequestMapping("/UpdateOneCategories/{id}")
	public ModelAndView UpdateOneCategories(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("UpdateCategories");
		
		mv.addObject("categorydata",cdao.getCategories(abc));
		
		return mv;
	}
	
	@RequestMapping(value="/UpdateCategoryToDB",method=RequestMethod.POST)
	public ModelAndView UpdateCategoryToDB( HttpServletRequest req )
	{
		ModelAndView mv = new ModelAndView("redirect:/Dashboard");
		
		String params[] = req.getParameterValues("category");
		
		Categories cg = new Categories();
		
		for( int i = 0 ; i<params.length ; i++ )
		{
			switch(i)
			{
			case 0: cg.setId(Integer.parseInt(params[i])); break;
			case 1:	cg.setName(params[i]); break;
			case 2:	cg.setDescription(params[i]); break;

			}
		}
		
			
		this.cdao.update(cg);
		
		return mv;
	}
	
	@RequestMapping("/DeleteOneCategories/{id}")
	public ModelAndView DeleteOnecategories(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewCategories");
		
		cdao.delete(abc);
		
		return mv;
	}
	
	@RequestMapping("/ViewOneCategory/{id}")
	public ModelAndView ViewOneCategorie(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("ViewOneCategory");
		
		mv.addObject("categorydata",cdao.getCategories(abc));
		
		return mv;
	}
}
