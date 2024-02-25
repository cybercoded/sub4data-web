import axios from "axios";
import React,{useState,useEffect} from "react";
import { Link, useHistory } from "react-router-dom";
import swal from "sweetalert";


function EditCategory(props){

    const history=useHistory();
    
    const [categoryInput, setCategory] = useState([]);
    const [error, setError] = useState([]);
    const [checkbox, setCheckbox] = useState(false)

    useEffect(() => {
        const category_id=props.match.params.id;
        axios.get(`/api/edit-category/${category_id}`).then(res=>{
            if(res.data.status===200)
            {
                setCategory(res.data.category);
                let status = res.data.category.status === 1;
                setCheckbox(status)
                console.log(status)
            }
            else if(res.data.status===404)
            {
                swal('Error',res.data.message,"error");
                history.pushState('/admin/view-category')
            }
            
        });
    
      return () => {
        
      }
    }, [props.match.params.id,history])
    
    const handleInput= (e)=>{
        e.persist();
        setCategory({...categoryInput,[e.target.name]:e.target.value});
    }

    const handleCheckBox = (e) => {
        e.persist();
        setCheckbox(e.target.checked)
    };

    const [picture, setPicture] = useState([]);
    const handleImage =(e)=>{
        setPicture({image: e.target.files[0]});
    }

    const updateCategory= (e)=>{
        e.preventDefault();
        const formData=new FormData();

        formData.append('image', picture.image);
        formData.append('slug', categoryInput.slug);
        formData.append('name', categoryInput.name);
        formData.append('description', categoryInput.description);
        formData.append('status',  categoryInput.status);
        formData.append('meta_title', categoryInput.meta_title);
        formData.append('meta_description', categoryInput.meta_description);
        formData.append('meta_keyword', categoryInput.meta_keyword);

        const category_id=props.match.params.id;
        axios.post(`api/update-category/${category_id}`, formData).then(res=>{
            if(res.data.status===200){
                swal("Success",res.data.message,"success").then(() =>{
                    window.location.reload();
                });
            }else if(res.data.status===422){
                setError(res.data.errors);
                swal("Error",res.data.errors,'warning');
            }
            else if(res.data.status===404){
                setError([]);
                swal("Error",res.data.message,'error');
                history.push('admin/view-category');
            }
        });
    }

    return(
        <div className="container px-4">
             <div className="card mt-4">
                
                <div className="card-header">
                    <h4>Edit Category | 
                        <Link to="/admin/view-category" className="btn btn-primary btn-sm float-end">Back</Link>
                    </h4>
                </div>
                <div className="card-body">
                    <form onSubmit={updateCategory} id="EDIT_CATEGORY_FORM">
                    <ul className="nav nav-tabs" id="myTab" role="tablist">
                        <li className="nav-item" role="presentation">
                            <button className="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Home</button>
                        </li>
                        <li className="nav-item" role="presentation">
                            <button className="nav-link" id="seo-tags-tab" data-bs-toggle="tab" data-bs-target="#seo-tags" type="button" role="tab" aria-controls="seo-tags" aria-selected="false">SEO Tags</button>
                        </li>
                    </ul>
                    <div className="tab-content" id="myTabContent">
                        <div className="tab-pane card-body border fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div className="form-group mb-3">
                                <label>Slug</label>
                                <input type="text" name="slug" onChange={handleInput} value={categoryInput.slug} className="form-control" />
                                <small className="text-danger">{error?.slug}</small>
                            </div>
                            <div className="form-group mb-3">
                                <label>Name</label>
                                <input type="text" name="name" onChange={handleInput} value={categoryInput.name} className="form-control" />
                                <small className="text-danger">{error?.name}</small>
                             </div>
                            <div className="form-group mb-3">
                                <label>Description</label>
                                <input name="description" onChange={handleInput} value={categoryInput.description} className="form-control" />
                            </div>
                            <div className="form-group mb-3">
                                <label>Status</label>
                                <input type="checkbox" name="status" onChange={handleCheckBox} checked={checkbox} />
                            </div>
                        </div>
                        <div className="tab-pane card-body border fade" id="seo-tags" role="tabpanel" aria-labelledby="seo-tags-tab">
                            <div className="form-group mb-3">
                                <label>Meta Title</label>
                                <input type="text" name="meta_title"  onChange={handleInput} value={categoryInput.meta_title} className="form-control" />
                                <small className="text-danger">{error?.meta_title}</small>
                            </div>
                            <div className="form-group mb-3">
                                <label>Meta Keywords</label>
                                <input name="meta_keyword"  onChange={handleInput} value={categoryInput.meta_keyword} className="form-control" />
                                <small className="text-danger">{error?.meta_keyword}</small>
                            </div>
                            <div className="form-group mb-3">
                                <label>Meta Description</label>
                                <input name="meta_description"  onChange={handleInput} value={categoryInput.meta_description} className="form-control" />
                                <small className="text-danger">{error?.meta_description}</small>
                            </div>
                            <div className="form-group mb-3">
                                <label>Image</label>
                                <input type="file" onChange={handleImage}  name="image" className="form-control" />
                                <img src={`${process.env.REACT_APP_URL}${categoryInput.image}`} alt={categoryInput.image} width="50" height="50" />
                                <small className="text-danger">{error?.image}</small>
                            </div>                            
                        </div>  
                    </div>

                    <button type="submit" className="btn btn-primary px-4 float-end">Update</button>
                </form>
                </div>
                
            </div>
        </div>
    );

}


export default EditCategory;