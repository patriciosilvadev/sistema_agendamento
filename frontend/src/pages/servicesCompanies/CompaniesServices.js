import React, { useState, useEffect } from 'react';
import { useParams, useHistory} from "react-router-dom"
import {Menu, Footer, Services} from '../../Person/person';



import '../../css/font-awesome.min.css';
import '../../css/bootstrap.min.css';
import '../../css/animate.css';
import '../style.css';

import api from '../../services/api';

export default function CompaniesServices(){
    //Aqui eu pego o parametro da url sem gambiarra estudar mais sobre isso
    //https://dev.to/finallynero/hooks-introduced-in-react-router-v5-1-7g8 Esse é o link do site
	//file:///C:/Users/Rendrikson/Desktop/tampletes/seotime/seotime/page-ebooks.html
	

	const [services, setServices] = useState([]);
	const [loading, setLoading] = useState(false);
	//const [date, setDate] = useState([]);

	const token = localStorage.getItem('Token');

	const logon = useHistory();
	
	const id = useParams();

	const [schedules, setSchedules] = useState('');
    const [account, setAccount] = useState('');
    const [login, setLogin] =useState(false)
	
	useEffect(()=>{
		const fetchServices = ()=>{
			setLoading(true);
			api.get(`servicesCompany/${id.id}`, {
				headers:{
					auther: token,
				}
			}).then(res=>{
				console.log(res)
				//VERIFICO SE O USUÁRIO ESTÁ LOGADO, SE NÃO ESTIVER VAI SER PRECISO FAZER O LOGIN
				if(res.data.error){
					alert('Realize o login para verificar os serviços da empresa')
					localStorage.clear();
					logon.push('/login')
				}else{
					console.log(res.data.user.id);
					//salvo o id do usuário 
					localStorage.setItem('id_user', res.data.user.id);
					setServices(res.data.services);
					setLoading(false);
				}
			})

			//responsável por pegar o id do usuário e mudar o Menu se alguém estiver logado
			api.get('userId',{
                headers:{
                    auther: token
                }
            }).then(res=>{
                //console.log(res);
                if(!res.data.error){
                    localStorage.setItem('id_user', res.data.id);
                    setSchedules('Seus Agendamentos');
                    setAccount('Minha Conta');  
                    setLogin(true)
                }
            })

		}

		fetchServices();
	}, [])



    return(
        <div>
		
			<Menu schedules={schedules} account={account} login={login}/>
            <section className="section transheaderServices bgcolor">
			<div className="container">
				<div className="row">	
					<div className="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>Nome do estabelecimento</h2>
					</div>
				</div>
			</div>
		</section>

        <section className="section">
			<div className="container">
				<div className="row">
					<ul>
					<Services loading={loading} services={services} id={id.id}/>
					</ul>
				</div>
			</div>
		</section>
        <Footer/>


        </div>
    )
}
