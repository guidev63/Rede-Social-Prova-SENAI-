import {BrowserRouter,Route,Routes} from 'react-router-dom'



import Main from './pages/main';





    
export default function Rotas(){
    return(
       <BrowserRouter>
            <Routes>
                <Route path="/" exact element={<Main />} />
            </Routes>
       
       </BrowserRouter>

    )
}