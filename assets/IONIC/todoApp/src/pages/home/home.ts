import { Component } from '@angular/core';
import { NavController } from 'ionic-angular';
import {Task} from "../../models/Task";

@Component({
  selector: 'page-home',
  templateUrl: 'home.html'
})
export class HomePage {

  constructor(public navCtrl: NavController) {}
  task:Task = new Task();
  active : boolean = true;
  taches:Task[] = [
    {titre: 'Realiser un Portfolio', status: false},
    {titre: 'Faire une tourte à la framboise', status: false},
    {titre: 'Faire un gigot à la vanille', status: false},
    {titre: 'Rendre visite à ma tante au Maroc', status: false},
    {titre: 'Refaire mon CV', status: false},
    {titre: 'Aller au pub', status: false},
  ];
  saveTask(){
    console.log(this.task);
    this.taches.push(this.task);
    this.task = new Task();
    this.active = false;
    setTimeout(() => this.active = true, 0);
  }

}
