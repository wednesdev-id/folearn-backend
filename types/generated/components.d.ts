import type { Schema, Struct } from '@strapi/strapi';

export interface MataPelajaranKompetensiItem extends Struct.ComponentSchema {
  collectionName: 'components_mata_pelajaran_kompetensi_items';
  info: {
    displayName: 'kompetensi_item';
  };
  attributes: {
    icon_kompetensi: Schema.Attribute.Media<'images'>;
    isi_kompetensi: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

export interface MataPelajaranTujuanPembelajaranItem
  extends Struct.ComponentSchema {
  collectionName: 'components_mata_pelajaran_tujuan_pembelajaran_items';
  info: {
    displayName: 'tujuan_pembelajaran_item';
  };
  attributes: {
    isi_tujuan: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

declare module '@strapi/strapi' {
  export module Public {
    export interface ComponentSchemas {
      'mata-pelajaran.kompetensi-item': MataPelajaranKompetensiItem;
      'mata-pelajaran.tujuan-pembelajaran-item': MataPelajaranTujuanPembelajaranItem;
    }
  }
}
