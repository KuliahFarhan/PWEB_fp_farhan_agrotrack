# Database Plan

Planned tables based on the PRD:
- `users`
- `tanaman`
- `lahan`
- `musim_tanam`
- `biaya_produksi`
- `hasil_panen`

Key relationships:
- One petani user has many lahan.
- One lahan has many musim tanam.
- One tanaman can be used by many musim tanam.
- One musim tanam has many biaya produksi.
- One musim tanam has one hasil panen.

The actual SQL schema will be written in `database/schema.sql` later.
