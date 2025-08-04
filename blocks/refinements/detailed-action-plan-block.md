## 🎬 Detailed Action Plan
> 💡 *Detailed implementation steps for each high-level CRUD operation. Specify exact files, methods, and content to be created or modified. Include code examples showing exactly what to implement.*

[Break down each high-level step into specific implementation actions with code examples]

```
<example>
### 1. Create [[database-schema]]
- Create file: `database/migrations/001_create_items_table.sql`
  ```sql
  CREATE TABLE items (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'active',
    created_by UUID REFERENCES users(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
  );
  
  CREATE INDEX idx_items_status ON items(status);
  CREATE INDEX idx_items_created_by ON items(created_by);
  ```

- Create file: `src/types/database/item.ts`
  ```typescript
  export interface Item {
    id: string;
    name: string;
    description?: string;
    status: 'active' | 'inactive' | 'deleted';
    created_by: string;
    created_at: Date;
    updated_at: Date;
  }
  
  export type CreateItemDto = Omit<Item, 'id' | 'created_at' | 'updated_at'>;
  export type UpdateItemDto = Partial<Omit<Item, 'id' | 'created_at'>>;
  ```

### 2. Create [[api-endpoints]]
- Update file: `src/api/routes/index.ts`
  - Add at line 15 after other route imports:
  ```typescript
  import itemRoutes from './items';
  ```
  - Add at line 32 in the route registration section:
  ```typescript
  router.use('/items', authenticate, itemRoutes);
  ```

- Create file: `src/api/routes/items.ts`
  ```typescript
  import { Router } from 'express';
  import { body, query } from 'express-validator';
  import { ItemController } from '../controllers/items.controller';
  import { validate } from '../middleware/validate';
  import { authorize } from '../middleware/authorize';
  
  const router = Router();
  const controller = new ItemController();
  
  router.get('/',
    query('page').optional().isInt({ min: 1 }),
    query('limit').optional().isInt({ min: 1, max: 100 }),
    query('status').optional().isIn(['active', 'inactive', 'deleted']),
    validate,
    authorize('items.read'),
    controller.list
  );
  
  router.post('/',
    body('name').notEmpty().trim().isLength({ max: 255 }),
    body('description').optional().trim(),
    body('status').optional().isIn(['active', 'inactive']),
    validate,
    authorize('items.create'),
    controller.create
  );
  
  export default router;
  ```

### 3. Create [[item-service]]
- Create file: `src/services/item.service.ts`
  ```typescript
  import { db } from '../database';
  import { Item, CreateItemDto, UpdateItemDto } from '../types/database/item';
  import { PaginationParams, PaginatedResult } from '../types/common';
  
  export class ItemService {
    async list(params: PaginationParams & { status?: string }): Promise<PaginatedResult<Item>> {
      const { page = 1, limit = 20, status } = params;
      const offset = (page - 1) * limit;
      
      let query = db('items').select('*').limit(limit).offset(offset);
      
      if (status) {
        query = query.where('status', status);
      }
      
      const [items, countResult] = await Promise.all([
        query,
        db('items').count('* as total').where(status ? { status } : {})
      ]);
      
      return {
        data: items,
        page,
        limit,
        total: parseInt(countResult[0].total as string, 10)
      };
    }
    
    async create(data: CreateItemDto, userId: string): Promise<Item> {
      const [item] = await db('items')
        .insert({
          ...data,
          created_by: userId
        })
        .returning('*');
      
      return item;
    }
  }
  ```

[Continue with more detailed implementation steps including error handling, tests, and integration]
</example>
```
