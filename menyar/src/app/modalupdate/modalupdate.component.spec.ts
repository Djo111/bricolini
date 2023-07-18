import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModalupdateComponent } from './modalupdate.component';

describe('ModalupdateComponent', () => {
  let component: ModalupdateComponent;
  let fixture: ComponentFixture<ModalupdateComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ModalupdateComponent]
    });
    fixture = TestBed.createComponent(ModalupdateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
