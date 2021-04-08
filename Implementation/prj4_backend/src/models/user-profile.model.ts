import {Entity, model, property} from '@loopback/repository';

@model()
export class UserProfile extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  ID?: number;

  @property({
    type: 'string',
    required: true,
  })
  USR_NAME: string;

  @property({
    type: 'string',
    required: true,
  })
  EMAIL: string;

  @property({
    type: 'string',
    required: true,
  })
  PASS: string;


  constructor(data?: Partial<UserProfile>) {
    super(data);
  }
}

export interface UserProfileRelations {
  // describe navigational properties here
}

export type UserProfileWithRelations = UserProfile & UserProfileRelations;
