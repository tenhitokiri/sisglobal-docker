import { Component } from '@angular/core';
@Component({
	selector: 'mycomponent',
	templateUrl: './mycomponent.component.html'
})
export class MyComponent {
	public titulo: string;
	public comentario: string;
	public year: number;

	constructor() {
		this.titulo = 'Este es el titulo del componente';
		this.comentario = 'sdfasfasf salfjas fl sjf hweeee';
		this.year = 2020;
		console.log('componente cargado!!');
	}
}
