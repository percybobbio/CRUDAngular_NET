import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { appsettings } from '../Settings/appsettings';
import { Empleado } from '../Models/Empleado';
import { ResponseAPI } from '../Models/ResponseAPI';

@Injectable({
  providedIn: 'root'
})
export class EmpleadoService {
  private http=inject(HttpClient);
  private ApiUrl:string=appsettings.apiUrl+"Empleado";
  constructor() { }

  lista(){
    return this.http.get<Empleado[]>(this.ApiUrl);
  }

  obtener(id:number){
    return this.http.get<Empleado>(`${this.ApiUrl}/${id}`);
  }

  crear(objeto:Empleado){
    return this.http.post<ResponseAPI>(this.ApiUrl,objeto)
  }

  editar(objeto:Empleado){
    return this.http.put<ResponseAPI>(this.ApiUrl,objeto)
  }

  eliminar(id:number){
    return this.http.delete<ResponseAPI>(`${this.ApiUrl}/${id}`);
  }
}
